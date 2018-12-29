/*!
 * File:
 *  si446x_api_lib.h
 *
 * Description:
 *  This file contains the Si446x API library.
 *
 * Silicon Laboratories Confidential
 * Copyright 2011 Silicon Laboratories, Inc.
 */

#ifndef _SI446X_API_LIB_H_
#define _SI446X_API_LIB_H_

//extern SEGMENT_VARIABLE( Si446xCmd, union si446x_cmd_reply_union, SEG_XDATA );
extern	union si446x_cmd_reply_union Si446xCmd;

//extern SEGMENT_VARIABLE( Pro2Cmd[16], u8, SEG_XDATA );


#define SI466X_FIFO_SIZE 64

enum
{
    SI446X_SUCCESS,
    SI446X_NO_PATCH,
    SI446X_CTS_TIMEOUT,
    SI446X_PATCH_FAIL,
    SI446X_COMMAND_ERROR
};

/* Minimal driver support functions */
void si446x_reset(void);
void si446x_power_up(u8 BOOT_OPTIONS, u8 XTAL_OPTIONS, u32 XO_FREQ);

u8 si446x_configuration_init(const u8* pSetPropCmd);
u8 si446x_apply_patch(void);
void si446x_part_info(void);

void si446x_start_tx(u8 CHANNEL, u8 CONDITION, u16 TX_LEN);
void si446x_start_rx(u8 CHANNEL, u8 CONDITION, u16 RX_LEN, u8 NEXT_STATE1, u8 NEXT_STATE2, u8 NEXT_STATE3);

void si446x_get_int_status(u8 PH_CLR_PEND, u8 MODEM_CLR_PEND, u8 CHIP_CLR_PEND);
void si446x_gpio_pin_cfg(u8 GPIO0, u8 GPIO1, u8 GPIO2, u8 GPIO3, u8 NIRQ, u8 SDO, u8 GEN_CONFIG);

void si446x_set_property( u8 GROUP, u8 NUM_PROPS, u8 START_PROP, ... );
void si446x_change_state(u8 NEXT_STATE1);

void si446x_get_modem_status( u8 MODEM_CLR_PEND );
void si446x_get_modem_status_fast_clear_read( void );
#define RADIO_DRIVER_EXTENDED_SUPPORT
#ifdef RADIO_DRIVER_EXTENDED_SUPPORT
  /* Extended driver support functions */
  void si446x_nop(void);

  void si446x_fifo_info(u8 FIFO);
  void si446x_write_tx_fifo( u8 numBytes, u8* pData );
  void si446x_read_rx_fifo( u8 numBytes, u8* pRxData );

  void si446x_get_property(u8 GROUP, u8 NUM_PROPS, u8 START_PROP);
	
	//void si446x_get_modem_status( u8 MODEM_CLR_PEND );
	//void si446x_get_modem_status_fast_clear_read( void );
	
  #ifdef RADIO_DRIVER_FULL_SUPPORT
    /* Full driver support functions */
    void si446x_func_info(void);

    void si446x_frr_a_read(u8 respByteCount);
    void si446x_frr_b_read(u8 respByteCount);
    void si446x_frr_c_read(u8 respByteCount);
    void si446x_frr_d_read(u8 respByteCount);

    void si446x_get_adc_reading(u8 ADC_EN);
    void si446x_get_packet_info(u8 FIELD_NUMBER_MASK, u16 LEN, S16 DIFF_LEN );
    void si446x_get_ph_status(u8 PH_CLR_PEND);
    void si446x_get_modem_status( u8 MODEM_CLR_PEND );
    void si446x_get_chip_status( u8 CHIP_CLR_PEND );

    void si446x_ircal_manual(u8 IRCAL_AMP, u8 IRCAL_PH);
    void si446x_protocol_cfg(u8 PROTOCOL);

    void si446x_request_device_state(void);

    void si446x_tx_hop(u8 INTE, u8 FRAC2, u8 FRAC1, u8 FRAC0, u8 VCO_CNT1, u8 VCO_CNT0, u8 PLL_SETTLE_TIME1, u8 PLL_SETTLE_TIME0);
    void si446x_rx_hop(u8 INTE, u8 FRAC2, u8 FRAC1, u8 FRAC0, u8 VCO_CNT1, u8 VCO_CNT0);

    void si446x_start_tx_fast( void );
    void si446x_start_rx_fast( void );

    void si446x_get_int_status_fast_clear( void );
    void si446x_get_int_status_fast_clear_read( void );

    void si446x_gpio_pin_cfg_fast( void );

    void si446x_get_ph_status_fast_clear( void );
    void si446x_get_ph_status_fast_clear_read( void );

    void si446x_get_modem_status_fast_clear( void );
    void si446x_get_modem_status_fast_clear_read( void );

    void si446x_get_chip_status_fast_clear( void );
    void si446x_get_chip_status_fast_clear_read( void );

    void si446x_fifo_info_fast_reset(u8 FIFO);
    void si446x_fifo_info_fast_read(void);

  #endif
#endif


#endif //_SI446X_API_LIB_H_
