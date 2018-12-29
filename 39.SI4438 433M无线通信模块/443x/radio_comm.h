/*!
 * File:
 *  radio_comm.h
 *
 * Description:
 *  This file contains the RADIO communication layer.
 *
 * Silicon Laboratories Confidential
 * Copyright 2011 Silicon Laboratories, Inc.
 */
#ifndef _RADIO_COMM_H_
#define _RADIO_COMM_H_


                /* ======================================= *
                 *              I N C L U D E              *
                 * ======================================= */


                /* ======================================= *
                 *          D E F I N I T I O N S          *
                 * ======================================= */

//#define RADIO_CTS_TIMEOUT 255
#define RADIO_CTS_TIMEOUT 10000

                /* ======================================= *
                 *     G L O B A L   V A R I A B L E S     *
                 * ======================================= */

//extern SEGMENT_VARIABLE(radioCmd[16u], u8, SEG_XDATA);


                /* ======================================= *
                 *  F U N C T I O N   P R O T O T Y P E S  *
                 * ======================================= */

#if 1  //(defined SILABS_RADIO_SI446X) || (defined SILABS_RADIO_SI4455)
  u8 radio_comm_GetResp(u8 byteCount, u8* pData);
  void radio_comm_SendCmd(u8 byteCount, u8* pData);
  void radio_comm_ReadData(u8 cmd, u8 pollCts, u8 byteCount, u8* pData);
  void radio_comm_WriteData(u8 cmd, u8 pollCts, u8 byteCount, u8* pData);
#elif (defined SILABS_RADIO_SI4012)
  u8 radio_comm_GetResp(u8 byteCount, u8* pData);
  u8 radio_comm_SendCmd(u8 byteCount, u8* pData);
#endif

u8 radio_comm_PollCTS(void);
u8 radio_comm_SendCmdGetResp(u8 cmdByteCount, u8* pCmdData, \
                             u8 respByteCount, u8* pRespData);
void radio_comm_ClearCTS(void);

#endif //_RADIO_COMM_H_
