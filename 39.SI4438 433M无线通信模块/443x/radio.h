/*! @file radio.h
 * @brief This file contains the public functions controlling the radio chip.
 *
 * @b COPYRIGHT
 * @n Silicon Laboratories Confidential
 * @n Copyright 2012 Silicon Laboratories, Inc.
 * @n http://www.silabs.com
 */
#if 0

#ifndef RADIO_H_
#define RADIO_H_





/*! @file radio.h
 * @brief This file is contains the public radio interface functions.
 *
 * @b COPYRIGHT
 * @n Silicon Laboratories Confidential
 * @n Copyright 2012 Silicon Laboratories, Inc.
 * @n http://www.silabs.com
 */

#ifndef RADIO_H_
#define RADIO_H_

/*****************************************************************************
 *  Global Macros & Definitions
 *****************************************************************************/
/*! Maximal packet length definition (FIFO size) */
#define RADIO_MAX_PACKET_LENGTH     64u

/*****************************************************************************
 *  Global Typedefs & Enums
 *****************************************************************************/
typedef struct
{
    u8   *Radio_ConfigurationArray;

    u8   Radio_ChannelNumber;
    u8   Radio_PacketLength;
    u8   Radio_State_After_Power_Up;

    u16  Radio_Delay_Cnt_After_Reset;

    u8   Radio_CustomPayload[RADIO_MAX_PACKET_LENGTH];
} tRadioConfiguration;

/*****************************************************************************
 *  Global Variable Declarations
 *****************************************************************************/
extern const SEGMENT_VARIABLE_SEGMENT_POINTER(pRadioConfiguration, tRadioConfiguration, SEG_CODE, SEG_CODE);
extern SEGMENT_VARIABLE(customRadioPacket[RADIO_MAX_PACKET_LENGTH], u8, SEG_XDATA);
/*! Si446x configuration array */
extern const SEGMENT_VARIABLE(Radio_Configuration_Data_Array[], u8, SEG_CODE);

/*****************************************************************************
 *  Global Function Declarations
 *****************************************************************************/
void  vRadio_Init(void);
u8    bRadio_Check_Tx_RX(void);
void  vRadio_StartRX(u8,u8);
u8    bRadio_Check_Ezconfig(u16);
void  vRadio_StartTx_Variable_Packet(u8, u8*, u8);

#endif /* RADIO_H_ */


/*****************************************************************************
 *  Global Macros & Definitions
 *****************************************************************************/

/*****************************************************************************
 *  Global Typedefs & Enums
 *****************************************************************************/
typedef struct
{
    u8   *Radio_ConfigurationArray;

    u8   Radio_ChannelNumber;
    u8   Radio_PacketLength;
    u8   Radio_State_After_Power_Up;

    u16  Radio_Delay_Cnt_After_Reset;
} tRadioConfiguration;

/*****************************************************************************
 *  Global Variable Declarations
 *****************************************************************************/
//extern const SEGMENT_VARIABLE_SEGMENT_POINTER(pRadioConfiguration, tRadioConfiguration, SEG_CODE, SEG_CODE);

/*! Si446x configuration array */
//extern const SEGMENT_VARIABLE(Radio_Configuration_Data_Array[], u8, SEG_CODE);

/*****************************************************************************
 *  Global Function Declarations
 *****************************************************************************/
void  vRadio_Init(void);
void  vRadio_StartTx(u8, u8 *);
void  vRadio_StartRX(u8);
u8    bRadio_Check_Ezconfig(u16);

#endif /* RADIO_H_ */

#endif
/*! @file radio.h
 * @brief This file is contains the public radio interface functions.
 *
 * @b COPYRIGHT
 * @n Silicon Laboratories Confidential
 * @n Copyright 2012 Silicon Laboratories, Inc.
 * @n http://www.silabs.com
 */

#ifndef RADIO_H_
#define RADIO_H_

#include "stm8l15x.h"
/*****************************************************************************
 *  Global Macros & Definitions
 *****************************************************************************/
/*! Maximal packet length definition (FIFO size) */
#define RADIO_MAX_PACKET_LENGTH     64u



/*****************************************************************************
 *  Global Typedefs & Enums
 *****************************************************************************/
typedef struct
{
    u8   *Radio_ConfigurationArray;

    u8   Radio_ChannelNumber;
    u8   Radio_PacketLength;
    u8   Radio_State_After_Power_Up;

    u16  Radio_Delay_Cnt_After_Reset;

    u8   Radio_CustomPayload[RADIO_MAX_PACKET_LENGTH];
} tRadioConfiguration;

/*****************************************************************************
 *  Global Variable Declarations
 *****************************************************************************/
//extern const SEGMENT_VARIABLE_SEGMENT_POINTER(pRadioConfiguration, tRadioConfiguration, SEG_CODE, SEG_CODE);
//extern SEGMENT_VARIABLE(customRadioPacket[RADIO_MAX_PACKET_LENGTH], u8, SEG_XDATA);

/*! Si446x configuration array */
//extern const SEGMENT_VARIABLE(Radio_Configuration_Data_Array[], u8, SEG_CODE);

/*****************************************************************************
 *  Global Function Declarations
 *****************************************************************************/
void  vRadio_Init(void);
u8    bRadio_Check_Tx_RX(void);
void  vRadio_StartRX(u8,u8);
u8    bRadio_Check_Ezconfig(u16);
void  vRadio_StartTx_Variable_Packet(u8, u8*, u8);
void vRadio_StartTx_Variable_Packet_2(u8 channel, u8 *pioRadioPacket, u8 length);
u8 vRadio_Set_PA_Level(u8 level);
void vRadio_Tx_TO_Rx(void);
u8 vRadio_Set_Rate(u8 rate);
void vRadio_ShutDown(void);
#endif /* RADIO_H_ */

