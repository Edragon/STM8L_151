/*
 * File:
 *  radio_hal.h
 *
 * Description:
 *  This file contains RADIO HAL.
 *
 * Silicon Laboratories Confidential
 * Copyright 2011 Silicon Laboratories, Inc.
 */

#ifndef _RADIO_HAL_H_
#define _RADIO_HAL_H_

                /* ======================================= *
                 *              I N C L U D E              *
                 * ======================================= */

                /* ======================================= *
                 *          D E F I N I T I O N S          *
                 * ======================================= */

                /* ======================================= *
                 *     G L O B A L   V A R I A B L E S     *
                 * ======================================= */

                /* ======================================= *
                 *  F U N C T I O N   P R O T O T Y P E S  *
                 * ======================================= */

void MCU_PinInit(void);
void radio_hal_AssertShutdown(void);
void radio_hal_DeassertShutdown(void);
void radio_hal_ClearNsel(void);
void radio_hal_SetNsel(void);
u8 radio_hal_NirqLevel(void);

void radio_hal_SpiWriteByte(u8 byteToWrite);
u8 radio_hal_SpiReadByte(void);

void radio_hal_SpiWriteData(u8 byteCount, u8* pData);
void radio_hal_SpiReadData(u8 byteCount, u8* pData);

#ifdef DRIVERS_EXTENDED_SUPPORT
  u8 radio_hal_Gpio0Level(void);
  u8 radio_hal_Gpio1Level(void);
  u8 radio_hal_Gpio2Level(void);
  u8 radio_hal_Gpio3Level(void);
#endif

#endif //_RADIO_HAL_H_
