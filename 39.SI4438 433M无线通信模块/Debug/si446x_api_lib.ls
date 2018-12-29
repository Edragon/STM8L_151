   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  45                     ; 34 void si446x_get_modem_status( u8 MODEM_CLR_PEND )
  45                     ; 35 {
  46                     	switch	.text
  47  0000               f_si446x_get_modem_status:
  51                     ; 36     Pro2Cmd[0] = SI446X_CMD_ID_GET_MODEM_STATUS;
  53  0000 35220000      	mov	_Pro2Cmd,#34
  54                     ; 37     Pro2Cmd[1] = MODEM_CLR_PEND;
  56  0004 c70001        	ld	_Pro2Cmd+1,a
  57                     ; 39     radio_comm_SendCmdGetResp( SI446X_CMD_ARG_COUNT_GET_MODEM_STATUS,
  57                     ; 40                               Pro2Cmd,
  57                     ; 41                               SI446X_CMD_REPLY_COUNT_GET_MODEM_STATUS,
  57                     ; 42                               Pro2Cmd );
  59  0007 ae0000        	ldw	x,#_Pro2Cmd
  60  000a 89            	pushw	x
  61  000b 4b08          	push	#8
  62  000d ae0000        	ldw	x,#_Pro2Cmd
  63  0010 89            	pushw	x
  64  0011 a602          	ld	a,#2
  65  0013 8d000000      	callf	f_radio_comm_SendCmdGetResp
  67  0017 5b05          	addw	sp,#5
  68                     ; 44     Si446xCmd.GET_MODEM_STATUS.MODEM_PEND   = Pro2Cmd[0];
  70  0019 5500000010    	mov	_Si446xCmd,_Pro2Cmd
  71                     ; 45     Si446xCmd.GET_MODEM_STATUS.MODEM_STATUS = Pro2Cmd[1];
  73  001e 5500010011    	mov	_Si446xCmd+1,_Pro2Cmd+1
  74                     ; 46     Si446xCmd.GET_MODEM_STATUS.CURR_RSSI    = Pro2Cmd[2];
  76  0023 5500020012    	mov	_Si446xCmd+2,_Pro2Cmd+2
  77                     ; 47     Si446xCmd.GET_MODEM_STATUS.LATCH_RSSI   = Pro2Cmd[3];
  79  0028 5500030013    	mov	_Si446xCmd+3,_Pro2Cmd+3
  80                     ; 48     Si446xCmd.GET_MODEM_STATUS.ANT1_RSSI    = Pro2Cmd[4];
  82  002d 5500040014    	mov	_Si446xCmd+4,_Pro2Cmd+4
  83                     ; 49     Si446xCmd.GET_MODEM_STATUS.ANT2_RSSI    = Pro2Cmd[5];
  85  0032 5500050015    	mov	_Si446xCmd+5,_Pro2Cmd+5
  86                     ; 50     Si446xCmd.GET_MODEM_STATUS.AFC_FREQ_OFFSET =  ((u16)Pro2Cmd[6] << 8) & 0xFF00;
  88  0037 c60006        	ld	a,_Pro2Cmd+6
  89  003a 5f            	clrw	x
  90  003b 97            	ld	xl,a
  91  003c 4f            	clr	a
  92  003d 02            	rlwa	x,a
  93  003e 01            	rrwa	x,a
  94  003f 9f            	ld	a,xl
  95  0040 a4ff          	and	a,#255
  96  0042 97            	ld	xl,a
  97  0043 4f            	clr	a
  98  0044 c70017        	ld	_Si446xCmd+7,a
  99  0047 9f            	ld	a,xl
 100  0048 c70016        	ld	_Si446xCmd+6,a
 101                     ; 51     Si446xCmd.GET_MODEM_STATUS.AFC_FREQ_OFFSET |= (u16)Pro2Cmd[7] & 0x00FF;
 103  004b c60007        	ld	a,_Pro2Cmd+7
 104  004e 5f            	clrw	x
 105  004f a4ff          	and	a,#255
 106  0051 5f            	clrw	x
 107  0052 ca0017        	or	a,_Si446xCmd+7
 108  0055 c70017        	ld	_Si446xCmd+7,a
 109  0058 9f            	ld	a,xl
 110  0059 ca0016        	or	a,_Si446xCmd+6
 111  005c c70016        	ld	_Si446xCmd+6,a
 112                     ; 52 }
 115  005f 87            	retf
 149                     ; 60 void si446x_reset(void)
 149                     ; 61 {
 150                     	switch	.text
 151  0060               f_si446x_reset:
 153  0060 88            	push	a
 154       00000001      OFST:	set	1
 157                     ; 65     radio_hal_AssertShutdown();
 159  0061 8d000000      	callf	f_radio_hal_AssertShutdown
 161                     ; 67     for (loopCount = 255; loopCount != 0; loopCount--);
 163  0065 a6ff          	ld	a,#255
 164  0067 6b01          	ld	(OFST+0,sp),a
 165  0069               L14:
 169  0069 0a01          	dec	(OFST+0,sp)
 172  006b 0d01          	tnz	(OFST+0,sp)
 173  006d 26fa          	jrne	L14
 174                     ; 68     radio_hal_DeassertShutdown();
 176  006f 8d000000      	callf	f_radio_hal_DeassertShutdown
 178                     ; 69     for (loopCount = 255; loopCount != 0; loopCount--);
 180  0073 a6ff          	ld	a,#255
 181  0075 6b01          	ld	(OFST+0,sp),a
 182  0077               L74:
 186  0077 0a01          	dec	(OFST+0,sp)
 189  0079 0d01          	tnz	(OFST+0,sp)
 190  007b 26fa          	jrne	L74
 191                     ; 70     radio_comm_ClearCTS();
 193  007d 8d000000      	callf	f_radio_comm_ClearCTS
 195                     ; 71 }
 198  0081 84            	pop	a
 199  0082 87            	retf
 246                     ; 77 void si446x_power_up(u8 BOOT_OPTIONS, u8 XTAL_OPTIONS, u32 XO_FREQ)
 246                     ; 78 {
 247                     	switch	.text
 248  0083               f_si446x_power_up:
 250  0083 89            	pushw	x
 251       00000000      OFST:	set	0
 254                     ; 79     Pro2Cmd[0] = SI446X_CMD_ID_POWER_UP;
 256  0084 35020000      	mov	_Pro2Cmd,#2
 257                     ; 80     Pro2Cmd[1] = BOOT_OPTIONS;
 259  0088 9e            	ld	a,xh
 260  0089 c70001        	ld	_Pro2Cmd+1,a
 261                     ; 81     Pro2Cmd[2] = XTAL_OPTIONS;
 263  008c 9f            	ld	a,xl
 264  008d c70002        	ld	_Pro2Cmd+2,a
 265                     ; 82     Pro2Cmd[3] = (u8)(XO_FREQ >> 24);
 267  0090 7b06          	ld	a,(OFST+6,sp)
 268  0092 c70003        	ld	_Pro2Cmd+3,a
 269                     ; 83     Pro2Cmd[4] = (u8)(XO_FREQ >> 16);
 271  0095 7b07          	ld	a,(OFST+7,sp)
 272  0097 c70004        	ld	_Pro2Cmd+4,a
 273                     ; 84     Pro2Cmd[5] = (u8)(XO_FREQ >> 8);
 275  009a 7b08          	ld	a,(OFST+8,sp)
 276  009c c70005        	ld	_Pro2Cmd+5,a
 277                     ; 85     Pro2Cmd[6] = (u8)(XO_FREQ);
 279  009f 7b09          	ld	a,(OFST+9,sp)
 280  00a1 c70006        	ld	_Pro2Cmd+6,a
 281                     ; 87     radio_comm_SendCmd( SI446X_CMD_ARG_COUNT_POWER_UP, Pro2Cmd );
 283  00a4 ae0000        	ldw	x,#_Pro2Cmd
 284  00a7 89            	pushw	x
 285  00a8 a607          	ld	a,#7
 286  00aa 8d000000      	callf	f_radio_comm_SendCmd
 288  00ae 85            	popw	x
 289                     ; 88 }
 292  00af 85            	popw	x
 293  00b0 87            	retf
 347                     ; 94 u8 si446x_configuration_init(const u8* pSetPropCmd)
 347                     ; 95 {
 348                     	switch	.text
 349  00b1               f_si446x_configuration_init:
 351  00b1 89            	pushw	x
 352  00b2 89            	pushw	x
 353       00000002      OFST:	set	2
 356  00b3 206a          	jra	L121
 357  00b5               L711:
 358                     ; 109     numOfBytes = *pSetPropCmd++;
 360  00b5 1e03          	ldw	x,(OFST+1,sp)
 361  00b7 1c0001        	addw	x,#1
 362  00ba 1f03          	ldw	(OFST+1,sp),x
 363  00bc 1d0001        	subw	x,#1
 364  00bf f6            	ld	a,(x)
 365  00c0 6b01          	ld	(OFST-1,sp),a
 366                     ; 111     if (numOfBytes > 35u)
 368  00c2 7b01          	ld	a,(OFST-1,sp)
 369  00c4 a124          	cp	a,#36
 370  00c6 2504          	jrult	L521
 371                     ; 114       return SI446X_COMMAND_ERROR;
 373  00c8 a604          	ld	a,#4
 375  00ca 2034          	jra	L41
 376  00cc               L521:
 377                     ; 117     for (col = 0u; col < numOfBytes; col++)
 379  00cc 0f02          	clr	(OFST+0,sp)
 381  00ce 2014          	jra	L331
 382  00d0               L721:
 383                     ; 119       Pro2Cmd[col] = *pSetPropCmd;
 385  00d0 7b02          	ld	a,(OFST+0,sp)
 386  00d2 5f            	clrw	x
 387  00d3 97            	ld	xl,a
 388  00d4 1603          	ldw	y,(OFST+1,sp)
 389  00d6 90f6          	ld	a,(y)
 390  00d8 d70000        	ld	(_Pro2Cmd,x),a
 391                     ; 120       pSetPropCmd++;
 393  00db 1e03          	ldw	x,(OFST+1,sp)
 394  00dd 1c0001        	addw	x,#1
 395  00e0 1f03          	ldw	(OFST+1,sp),x
 396                     ; 117     for (col = 0u; col < numOfBytes; col++)
 398  00e2 0c02          	inc	(OFST+0,sp)
 399  00e4               L331:
 402  00e4 7b02          	ld	a,(OFST+0,sp)
 403  00e6 1101          	cp	a,(OFST-1,sp)
 404  00e8 25e6          	jrult	L721
 405                     ; 123     if (radio_comm_SendCmdGetResp(numOfBytes, Pro2Cmd, 0, 0) != 0xFF)
 407  00ea 5f            	clrw	x
 408  00eb 89            	pushw	x
 409  00ec 4b00          	push	#0
 410  00ee ae0000        	ldw	x,#_Pro2Cmd
 411  00f1 89            	pushw	x
 412  00f2 7b06          	ld	a,(OFST+4,sp)
 413  00f4 8d000000      	callf	f_radio_comm_SendCmdGetResp
 415  00f8 5b05          	addw	sp,#5
 416  00fa a1ff          	cp	a,#255
 417  00fc 2705          	jreq	L731
 418                     ; 126       return SI446X_CTS_TIMEOUT;
 420  00fe a602          	ld	a,#2
 422  0100               L41:
 424  0100 5b04          	addw	sp,#4
 425  0102 87            	retf
 426  0103               L731:
 427                     ; 129     if (radio_hal_NirqLevel() == 0)
 429  0103 8d000000      	callf	f_radio_hal_NirqLevel
 431  0107 4d            	tnz	a
 432  0108 2615          	jrne	L121
 433                     ; 132       si446x_get_int_status(0, 0, 0);
 435  010a 4b00          	push	#0
 436  010c 5f            	clrw	x
 437  010d 4f            	clr	a
 438  010e 95            	ld	xh,a
 439  010f 8d010201      	callf	f_si446x_get_int_status
 441  0113 84            	pop	a
 442                     ; 133       if (Si446xCmd.GET_INT_STATUS.CHIP_PEND &    SI446X_CMD_GET_CHIP_STATUS_REP_CHIP_PEND_CMD_ERROR_PEND_MASK)
 444  0114 c60016        	ld	a,_Si446xCmd+6
 445  0117 a508          	bcp	a,#8
 446  0119 2704          	jreq	L121
 447                     ; 135         return SI446X_COMMAND_ERROR;
 449  011b a604          	ld	a,#4
 451  011d 20e1          	jra	L41
 452  011f               L121:
 453                     ; 102   while (*pSetPropCmd != 0x00)
 455  011f 1e03          	ldw	x,(OFST+1,sp)
 456  0121 7d            	tnz	(x)
 457  0122 2691          	jrne	L711
 458                     ; 140   return SI446X_SUCCESS;
 460  0124 4f            	clr	a
 462  0125 20d9          	jra	L41
 487                     ; 146 void si446x_part_info(void)
 487                     ; 147 {
 488                     	switch	.text
 489  0127               f_si446x_part_info:
 493                     ; 148     Pro2Cmd[0] = SI446X_CMD_ID_PART_INFO;
 495  0127 35010000      	mov	_Pro2Cmd,#1
 496                     ; 150     radio_comm_SendCmdGetResp( SI446X_CMD_ARG_COUNT_PART_INFO,
 496                     ; 151                               Pro2Cmd,
 496                     ; 152                               SI446X_CMD_REPLY_COUNT_PART_INFO,
 496                     ; 153                               Pro2Cmd );
 498  012b ae0000        	ldw	x,#_Pro2Cmd
 499  012e 89            	pushw	x
 500  012f 4b08          	push	#8
 501  0131 ae0000        	ldw	x,#_Pro2Cmd
 502  0134 89            	pushw	x
 503  0135 a601          	ld	a,#1
 504  0137 8d000000      	callf	f_radio_comm_SendCmdGetResp
 506  013b 5b05          	addw	sp,#5
 507                     ; 155     Si446xCmd.PART_INFO.CHIPREV         = Pro2Cmd[0];
 509  013d 5500000010    	mov	_Si446xCmd,_Pro2Cmd
 510                     ; 156     Si446xCmd.PART_INFO.PART            = ((u16)Pro2Cmd[1] << 8) & 0xFF00;
 512  0142 c60001        	ld	a,_Pro2Cmd+1
 513  0145 5f            	clrw	x
 514  0146 97            	ld	xl,a
 515  0147 4f            	clr	a
 516  0148 02            	rlwa	x,a
 517  0149 01            	rrwa	x,a
 518  014a 9f            	ld	a,xl
 519  014b a4ff          	and	a,#255
 520  014d 97            	ld	xl,a
 521  014e 4f            	clr	a
 522  014f c70012        	ld	_Si446xCmd+2,a
 523  0152 9f            	ld	a,xl
 524  0153 c70011        	ld	_Si446xCmd+1,a
 525                     ; 157     Si446xCmd.PART_INFO.PART           |= (u16)Pro2Cmd[2] & 0x00FF;
 527  0156 c60002        	ld	a,_Pro2Cmd+2
 528  0159 5f            	clrw	x
 529  015a a4ff          	and	a,#255
 530  015c 5f            	clrw	x
 531  015d ca0012        	or	a,_Si446xCmd+2
 532  0160 c70012        	ld	_Si446xCmd+2,a
 533  0163 9f            	ld	a,xl
 534  0164 ca0011        	or	a,_Si446xCmd+1
 535  0167 c70011        	ld	_Si446xCmd+1,a
 536                     ; 158     Si446xCmd.PART_INFO.PBUILD          = Pro2Cmd[3];
 538  016a 5500030013    	mov	_Si446xCmd+3,_Pro2Cmd+3
 539                     ; 159     Si446xCmd.PART_INFO.ID              = ((u16)Pro2Cmd[4] << 8) & 0xFF00;
 541  016f c60004        	ld	a,_Pro2Cmd+4
 542  0172 5f            	clrw	x
 543  0173 97            	ld	xl,a
 544  0174 4f            	clr	a
 545  0175 02            	rlwa	x,a
 546  0176 01            	rrwa	x,a
 547  0177 9f            	ld	a,xl
 548  0178 a4ff          	and	a,#255
 549  017a 97            	ld	xl,a
 550  017b 4f            	clr	a
 551  017c c70015        	ld	_Si446xCmd+5,a
 552  017f 9f            	ld	a,xl
 553  0180 c70014        	ld	_Si446xCmd+4,a
 554                     ; 160     Si446xCmd.PART_INFO.ID             |= (u16)Pro2Cmd[5] & 0x00FF;
 556  0183 c60005        	ld	a,_Pro2Cmd+5
 557  0186 5f            	clrw	x
 558  0187 a4ff          	and	a,#255
 559  0189 5f            	clrw	x
 560  018a ca0015        	or	a,_Si446xCmd+5
 561  018d c70015        	ld	_Si446xCmd+5,a
 562  0190 9f            	ld	a,xl
 563  0191 ca0014        	or	a,_Si446xCmd+4
 564  0194 c70014        	ld	_Si446xCmd+4,a
 565                     ; 161     Si446xCmd.PART_INFO.CUSTOMER        = Pro2Cmd[6];
 567  0197 5500060016    	mov	_Si446xCmd+6,_Pro2Cmd+6
 568                     ; 162     Si446xCmd.PART_INFO.ROMID           = Pro2Cmd[7];
 570  019c 5500070017    	mov	_Si446xCmd+7,_Pro2Cmd+7
 571                     ; 163 }
 574  01a1 87            	retf
 621                     ; 171 void si446x_start_tx(u8 CHANNEL, u8 CONDITION, u16 TX_LEN)
 621                     ; 172 {
 622                     	switch	.text
 623  01a2               f_si446x_start_tx:
 625  01a2 89            	pushw	x
 626       00000000      OFST:	set	0
 629                     ; 173     Pro2Cmd[0] = SI446X_CMD_ID_START_TX;
 631  01a3 35310000      	mov	_Pro2Cmd,#49
 632                     ; 174     Pro2Cmd[1] = CHANNEL;
 634  01a7 9e            	ld	a,xh
 635  01a8 c70001        	ld	_Pro2Cmd+1,a
 636                     ; 175     Pro2Cmd[2] = CONDITION;
 638  01ab 9f            	ld	a,xl
 639  01ac c70002        	ld	_Pro2Cmd+2,a
 640                     ; 176     Pro2Cmd[3] = (u8)(TX_LEN >> 8);
 642  01af 7b06          	ld	a,(OFST+6,sp)
 643  01b1 c70003        	ld	_Pro2Cmd+3,a
 644                     ; 177     Pro2Cmd[4] = (u8)(TX_LEN);
 646  01b4 7b07          	ld	a,(OFST+7,sp)
 647  01b6 c70004        	ld	_Pro2Cmd+4,a
 648                     ; 178     Pro2Cmd[5] = 0x00;
 650  01b9 725f0005      	clr	_Pro2Cmd+5
 651                     ; 182     Pro2Cmd[6] = 0x00;
 653  01bd 725f0006      	clr	_Pro2Cmd+6
 654                     ; 184     radio_comm_SendCmd( SI446X_CMD_ARG_COUNT_START_TX, Pro2Cmd );
 656  01c1 ae0000        	ldw	x,#_Pro2Cmd
 657  01c4 89            	pushw	x
 658  01c5 a607          	ld	a,#7
 659  01c7 8d000000      	callf	f_radio_comm_SendCmd
 661  01cb 85            	popw	x
 662                     ; 185 }
 665  01cc 85            	popw	x
 666  01cd 87            	retf
 734                     ; 197 void si446x_start_rx(u8 CHANNEL, u8 CONDITION, u16 RX_LEN, u8 NEXT_STATE1, u8 NEXT_STATE2, u8 NEXT_STATE3)
 734                     ; 198 {
 735                     	switch	.text
 736  01ce               f_si446x_start_rx:
 738  01ce 89            	pushw	x
 739       00000000      OFST:	set	0
 742                     ; 199     Pro2Cmd[0] = SI446X_CMD_ID_START_RX;
 744  01cf 35320000      	mov	_Pro2Cmd,#50
 745                     ; 200     Pro2Cmd[1] = CHANNEL;
 747  01d3 9e            	ld	a,xh
 748  01d4 c70001        	ld	_Pro2Cmd+1,a
 749                     ; 201     Pro2Cmd[2] = CONDITION;
 751  01d7 9f            	ld	a,xl
 752  01d8 c70002        	ld	_Pro2Cmd+2,a
 753                     ; 202     Pro2Cmd[3] = (u8)(RX_LEN >> 8);
 755  01db 7b06          	ld	a,(OFST+6,sp)
 756  01dd c70003        	ld	_Pro2Cmd+3,a
 757                     ; 203     Pro2Cmd[4] = (u8)(RX_LEN);
 759  01e0 7b07          	ld	a,(OFST+7,sp)
 760  01e2 c70004        	ld	_Pro2Cmd+4,a
 761                     ; 204     Pro2Cmd[5] = NEXT_STATE1;
 763  01e5 7b08          	ld	a,(OFST+8,sp)
 764  01e7 c70005        	ld	_Pro2Cmd+5,a
 765                     ; 205     Pro2Cmd[6] = NEXT_STATE2;
 767  01ea 7b09          	ld	a,(OFST+9,sp)
 768  01ec c70006        	ld	_Pro2Cmd+6,a
 769                     ; 206     Pro2Cmd[7] = NEXT_STATE3;
 771  01ef 7b0a          	ld	a,(OFST+10,sp)
 772  01f1 c70007        	ld	_Pro2Cmd+7,a
 773                     ; 208     radio_comm_SendCmd( SI446X_CMD_ARG_COUNT_START_RX, Pro2Cmd );
 775  01f4 ae0000        	ldw	x,#_Pro2Cmd
 776  01f7 89            	pushw	x
 777  01f8 a608          	ld	a,#8
 778  01fa 8d000000      	callf	f_radio_comm_SendCmd
 780  01fe 85            	popw	x
 781                     ; 209 }
 784  01ff 85            	popw	x
 785  0200 87            	retf
 834                     ; 218 void si446x_get_int_status(u8 PH_CLR_PEND, u8 MODEM_CLR_PEND, u8 CHIP_CLR_PEND)
 834                     ; 219 {
 835                     	switch	.text
 836  0201               f_si446x_get_int_status:
 838  0201 89            	pushw	x
 839       00000000      OFST:	set	0
 842                     ; 220     Pro2Cmd[0] = SI446X_CMD_ID_GET_INT_STATUS;
 844  0202 35200000      	mov	_Pro2Cmd,#32
 845                     ; 221     Pro2Cmd[1] = PH_CLR_PEND;
 847  0206 9e            	ld	a,xh
 848  0207 c70001        	ld	_Pro2Cmd+1,a
 849                     ; 222     Pro2Cmd[2] = MODEM_CLR_PEND;
 851  020a 9f            	ld	a,xl
 852  020b c70002        	ld	_Pro2Cmd+2,a
 853                     ; 223     Pro2Cmd[3] = CHIP_CLR_PEND;
 855  020e 7b06          	ld	a,(OFST+6,sp)
 856  0210 c70003        	ld	_Pro2Cmd+3,a
 857                     ; 225     radio_comm_SendCmdGetResp( SI446X_CMD_ARG_COUNT_GET_INT_STATUS,
 857                     ; 226                               Pro2Cmd,
 857                     ; 227                               SI446X_CMD_REPLY_COUNT_GET_INT_STATUS,
 857                     ; 228                               Pro2Cmd );
 859  0213 ae0000        	ldw	x,#_Pro2Cmd
 860  0216 89            	pushw	x
 861  0217 4b08          	push	#8
 862  0219 ae0000        	ldw	x,#_Pro2Cmd
 863  021c 89            	pushw	x
 864  021d a604          	ld	a,#4
 865  021f 8d000000      	callf	f_radio_comm_SendCmdGetResp
 867  0223 5b05          	addw	sp,#5
 868                     ; 230     Si446xCmd.GET_INT_STATUS.INT_PEND       = Pro2Cmd[0];
 870  0225 5500000010    	mov	_Si446xCmd,_Pro2Cmd
 871                     ; 231     Si446xCmd.GET_INT_STATUS.INT_STATUS     = Pro2Cmd[1];
 873  022a 5500010011    	mov	_Si446xCmd+1,_Pro2Cmd+1
 874                     ; 232     Si446xCmd.GET_INT_STATUS.PH_PEND        = Pro2Cmd[2];
 876  022f 5500020012    	mov	_Si446xCmd+2,_Pro2Cmd+2
 877                     ; 233     Si446xCmd.GET_INT_STATUS.PH_STATUS      = Pro2Cmd[3];
 879  0234 5500030013    	mov	_Si446xCmd+3,_Pro2Cmd+3
 880                     ; 234     Si446xCmd.GET_INT_STATUS.MODEM_PEND     = Pro2Cmd[4];
 882  0239 5500040014    	mov	_Si446xCmd+4,_Pro2Cmd+4
 883                     ; 235     Si446xCmd.GET_INT_STATUS.MODEM_STATUS   = Pro2Cmd[5];
 885  023e 5500050015    	mov	_Si446xCmd+5,_Pro2Cmd+5
 886                     ; 236     Si446xCmd.GET_INT_STATUS.CHIP_PEND      = Pro2Cmd[6];
 888  0243 5500060016    	mov	_Si446xCmd+6,_Pro2Cmd+6
 889                     ; 237     Si446xCmd.GET_INT_STATUS.CHIP_STATUS    = Pro2Cmd[7];
 891  0248 5500070017    	mov	_Si446xCmd+7,_Pro2Cmd+7
 892                     ; 238 }
 895  024d 85            	popw	x
 896  024e 87            	retf
 973                     ; 252 void si446x_gpio_pin_cfg(u8 GPIO0, u8 GPIO1, u8 GPIO2, u8 GPIO3, u8 NIRQ, u8 SDO, u8 GEN_CONFIG)
 973                     ; 253 {
 974                     	switch	.text
 975  024f               f_si446x_gpio_pin_cfg:
 977  024f 89            	pushw	x
 978       00000000      OFST:	set	0
 981                     ; 254     Pro2Cmd[0] = SI446X_CMD_ID_GPIO_PIN_CFG;
 983  0250 35130000      	mov	_Pro2Cmd,#19
 984                     ; 255     Pro2Cmd[1] = GPIO0;
 986  0254 9e            	ld	a,xh
 987  0255 c70001        	ld	_Pro2Cmd+1,a
 988                     ; 256     Pro2Cmd[2] = GPIO1;
 990  0258 9f            	ld	a,xl
 991  0259 c70002        	ld	_Pro2Cmd+2,a
 992                     ; 257     Pro2Cmd[3] = GPIO2;
 994  025c 7b06          	ld	a,(OFST+6,sp)
 995  025e c70003        	ld	_Pro2Cmd+3,a
 996                     ; 258     Pro2Cmd[4] = GPIO3;
 998  0261 7b07          	ld	a,(OFST+7,sp)
 999  0263 c70004        	ld	_Pro2Cmd+4,a
1000                     ; 259     Pro2Cmd[5] = NIRQ;
1002  0266 7b08          	ld	a,(OFST+8,sp)
1003  0268 c70005        	ld	_Pro2Cmd+5,a
1004                     ; 260     Pro2Cmd[6] = SDO;
1006  026b 7b09          	ld	a,(OFST+9,sp)
1007  026d c70006        	ld	_Pro2Cmd+6,a
1008                     ; 261     Pro2Cmd[7] = GEN_CONFIG;
1010  0270 7b0a          	ld	a,(OFST+10,sp)
1011  0272 c70007        	ld	_Pro2Cmd+7,a
1012                     ; 263     radio_comm_SendCmdGetResp( SI446X_CMD_ARG_COUNT_GPIO_PIN_CFG,
1012                     ; 264                               Pro2Cmd,
1012                     ; 265                               SI446X_CMD_REPLY_COUNT_GPIO_PIN_CFG,
1012                     ; 266                               Pro2Cmd );
1014  0275 ae0000        	ldw	x,#_Pro2Cmd
1015  0278 89            	pushw	x
1016  0279 4b07          	push	#7
1017  027b ae0000        	ldw	x,#_Pro2Cmd
1018  027e 89            	pushw	x
1019  027f a608          	ld	a,#8
1020  0281 8d000000      	callf	f_radio_comm_SendCmdGetResp
1022  0285 5b05          	addw	sp,#5
1023                     ; 268     Si446xCmd.GPIO_PIN_CFG.GPIO[0]        = Pro2Cmd[0];
1025  0287 5500000010    	mov	_Si446xCmd,_Pro2Cmd
1026                     ; 269     Si446xCmd.GPIO_PIN_CFG.GPIO[1]        = Pro2Cmd[1];
1028  028c 5500010011    	mov	_Si446xCmd+1,_Pro2Cmd+1
1029                     ; 270     Si446xCmd.GPIO_PIN_CFG.GPIO[2]        = Pro2Cmd[2];
1031  0291 5500020012    	mov	_Si446xCmd+2,_Pro2Cmd+2
1032                     ; 271     Si446xCmd.GPIO_PIN_CFG.GPIO[3]        = Pro2Cmd[3];
1034  0296 5500030013    	mov	_Si446xCmd+3,_Pro2Cmd+3
1035                     ; 272     Si446xCmd.GPIO_PIN_CFG.NIRQ         = Pro2Cmd[4];
1037  029b 5500040014    	mov	_Si446xCmd+4,_Pro2Cmd+4
1038                     ; 273     Si446xCmd.GPIO_PIN_CFG.SDO          = Pro2Cmd[5];
1040  02a0 5500050015    	mov	_Si446xCmd+5,_Pro2Cmd+5
1041                     ; 274     Si446xCmd.GPIO_PIN_CFG.GEN_CONFIG   = Pro2Cmd[6];
1043  02a5 5500060016    	mov	_Si446xCmd+6,_Pro2Cmd+6
1044                     ; 275 }
1047  02aa 85            	popw	x
1048  02ab 87            	retf
1113                     ; 288 void si446x_set_property( u8 GROUP, u8 NUM_PROPS, u8 START_PROP, ... )
1113                     ; 289 {
1114                     	switch	.text
1115  02ac               f_si446x_set_property:
1117  02ac 89            	pushw	x
1118  02ad 5203          	subw	sp,#3
1119       00000003      OFST:	set	3
1122                     ; 293     Pro2Cmd[0] = SI446X_CMD_ID_SET_PROPERTY;
1124  02af 35110000      	mov	_Pro2Cmd,#17
1125                     ; 294     Pro2Cmd[1] = GROUP;
1127  02b3 9e            	ld	a,xh
1128  02b4 c70001        	ld	_Pro2Cmd+1,a
1129                     ; 295     Pro2Cmd[2] = NUM_PROPS;
1131  02b7 9f            	ld	a,xl
1132  02b8 c70002        	ld	_Pro2Cmd+2,a
1133                     ; 296     Pro2Cmd[3] = START_PROP;
1135  02bb 7b09          	ld	a,(OFST+6,sp)
1136  02bd c70003        	ld	_Pro2Cmd+3,a
1137                     ; 298     va_start (argList, START_PROP);
1139  02c0 96            	ldw	x,sp
1140  02c1 1c000a        	addw	x,#OFST+7
1141  02c4 1f01          	ldw	(OFST-2,sp),x
1142                     ; 299     cmdIndex = 4;
1144  02c6 a604          	ld	a,#4
1145  02c8 6b03          	ld	(OFST+0,sp),a
1147  02ca 201a          	jra	L523
1148  02cc               L123:
1149                     ; 302         Pro2Cmd[cmdIndex] = va_arg (argList, int);	/*int 代替原来的  u8   */
1151  02cc 7b03          	ld	a,(OFST+0,sp)
1152  02ce 5f            	clrw	x
1153  02cf 97            	ld	xl,a
1154  02d0 1601          	ldw	y,(OFST-2,sp)
1155  02d2 72a90002      	addw	y,#2
1156  02d6 1701          	ldw	(OFST-2,sp),y
1157  02d8 1601          	ldw	y,(OFST-2,sp)
1158  02da 905a          	decw	y
1159  02dc 905a          	decw	y
1160  02de 90e601        	ld	a,(1,y)
1161  02e1 d70000        	ld	(_Pro2Cmd,x),a
1162                     ; 303         cmdIndex++;
1164  02e4 0c03          	inc	(OFST+0,sp)
1165  02e6               L523:
1166                     ; 300     while(NUM_PROPS--)
1168  02e6 7b05          	ld	a,(OFST+2,sp)
1169  02e8 0a05          	dec	(OFST+2,sp)
1170  02ea 4d            	tnz	a
1171  02eb 26df          	jrne	L123
1172                     ; 305     va_end(argList);
1174  02ed 1e01          	ldw	x,(OFST-2,sp)
1175                     ; 307     radio_comm_SendCmd( cmdIndex, Pro2Cmd );
1177  02ef ae0000        	ldw	x,#_Pro2Cmd
1178  02f2 89            	pushw	x
1179  02f3 7b05          	ld	a,(OFST+2,sp)
1180  02f5 8d000000      	callf	f_radio_comm_SendCmd
1182  02f9 85            	popw	x
1183                     ; 308 }
1186  02fa 5b05          	addw	sp,#5
1187  02fc 87            	retf
1221                     ; 315 void si446x_change_state(u8 NEXT_STATE1)
1221                     ; 316 {
1222                     	switch	.text
1223  02fd               f_si446x_change_state:
1227                     ; 317     Pro2Cmd[0] = SI446X_CMD_ID_CHANGE_STATE;
1229  02fd 35340000      	mov	_Pro2Cmd,#52
1230                     ; 318     Pro2Cmd[1] = NEXT_STATE1;
1232  0301 c70001        	ld	_Pro2Cmd+1,a
1233                     ; 320     radio_comm_SendCmd( SI446X_CMD_ARG_COUNT_CHANGE_STATE, Pro2Cmd );
1235  0304 ae0000        	ldw	x,#_Pro2Cmd
1236  0307 89            	pushw	x
1237  0308 a602          	ld	a,#2
1238  030a 8d000000      	callf	f_radio_comm_SendCmd
1240  030e 85            	popw	x
1241                     ; 321 }
1244  030f 87            	retf
1268                     ; 329 void si446x_nop(void)
1268                     ; 330 {
1269                     	switch	.text
1270  0310               f_si446x_nop:
1274                     ; 331     Pro2Cmd[0] = SI446X_CMD_ID_NOP;
1276  0310 725f0000      	clr	_Pro2Cmd
1277                     ; 333     radio_comm_SendCmd( SI446X_CMD_ARG_COUNT_NOP, Pro2Cmd );
1279  0314 ae0000        	ldw	x,#_Pro2Cmd
1280  0317 89            	pushw	x
1281  0318 a601          	ld	a,#1
1282  031a 8d000000      	callf	f_radio_comm_SendCmd
1284  031e 85            	popw	x
1285                     ; 334 }
1288  031f 87            	retf
1322                     ; 342 void si446x_fifo_info(u8 FIFO)
1322                     ; 343 {
1323                     	switch	.text
1324  0320               f_si446x_fifo_info:
1328                     ; 344     Pro2Cmd[0] = SI446X_CMD_ID_FIFO_INFO;
1330  0320 35150000      	mov	_Pro2Cmd,#21
1331                     ; 345     Pro2Cmd[1] = FIFO;
1333  0324 c70001        	ld	_Pro2Cmd+1,a
1334                     ; 347     radio_comm_SendCmdGetResp( SI446X_CMD_ARG_COUNT_FIFO_INFO,
1334                     ; 348                               Pro2Cmd,
1334                     ; 349                               SI446X_CMD_REPLY_COUNT_FIFO_INFO,
1334                     ; 350                               Pro2Cmd );
1336  0327 ae0000        	ldw	x,#_Pro2Cmd
1337  032a 89            	pushw	x
1338  032b 4b02          	push	#2
1339  032d ae0000        	ldw	x,#_Pro2Cmd
1340  0330 89            	pushw	x
1341  0331 a602          	ld	a,#2
1342  0333 8d000000      	callf	f_radio_comm_SendCmdGetResp
1344  0337 5b05          	addw	sp,#5
1345                     ; 352     Si446xCmd.FIFO_INFO.RX_FIFO_COUNT   = Pro2Cmd[0];
1347  0339 5500000010    	mov	_Si446xCmd,_Pro2Cmd
1348                     ; 353     Si446xCmd.FIFO_INFO.TX_FIFO_SPACE   = Pro2Cmd[1];
1350  033e 5500010011    	mov	_Si446xCmd+1,_Pro2Cmd+1
1351                     ; 354 }
1354  0343 87            	retf
1397                     ; 362 void si446x_write_tx_fifo(u8 numBytes, u8* pTxData)
1397                     ; 363 {
1398                     	switch	.text
1399  0344               f_si446x_write_tx_fifo:
1401  0344 88            	push	a
1402       00000000      OFST:	set	0
1405                     ; 364   radio_comm_WriteData( SI446X_CMD_ID_WRITE_TX_FIFO, 0, numBytes, pTxData );
1407  0345 1e05          	ldw	x,(OFST+5,sp)
1408  0347 89            	pushw	x
1409  0348 88            	push	a
1410  0349 5f            	clrw	x
1411  034a a666          	ld	a,#102
1412  034c 95            	ld	xh,a
1413  034d 8d000000      	callf	f_radio_comm_WriteData
1415  0351 5b03          	addw	sp,#3
1416                     ; 365 }
1419  0353 84            	pop	a
1420  0354 87            	retf
1463                     ; 373 void si446x_read_rx_fifo(u8 numBytes, u8* pRxData)
1463                     ; 374 {
1464                     	switch	.text
1465  0355               f_si446x_read_rx_fifo:
1467  0355 88            	push	a
1468       00000000      OFST:	set	0
1471                     ; 375   radio_comm_ReadData( SI446X_CMD_ID_READ_RX_FIFO, 0, numBytes, pRxData );
1473  0356 1e05          	ldw	x,(OFST+5,sp)
1474  0358 89            	pushw	x
1475  0359 88            	push	a
1476  035a 5f            	clrw	x
1477  035b a677          	ld	a,#119
1478  035d 95            	ld	xh,a
1479  035e 8d000000      	callf	f_radio_comm_ReadData
1481  0362 5b03          	addw	sp,#3
1482                     ; 376 }
1485  0364 84            	pop	a
1486  0365 87            	retf
1535                     ; 385 void si446x_get_property(u8 GROUP, u8 NUM_PROPS, u8 START_PROP)
1535                     ; 386 {
1536                     	switch	.text
1537  0366               f_si446x_get_property:
1539  0366 89            	pushw	x
1540       00000000      OFST:	set	0
1543                     ; 387     Pro2Cmd[0] = SI446X_CMD_ID_GET_PROPERTY;
1545  0367 35120000      	mov	_Pro2Cmd,#18
1546                     ; 388     Pro2Cmd[1] = GROUP;
1548  036b 9e            	ld	a,xh
1549  036c c70001        	ld	_Pro2Cmd+1,a
1550                     ; 389     Pro2Cmd[2] = NUM_PROPS;
1552  036f 9f            	ld	a,xl
1553  0370 c70002        	ld	_Pro2Cmd+2,a
1554                     ; 390     Pro2Cmd[3] = START_PROP;
1556  0373 7b06          	ld	a,(OFST+6,sp)
1557  0375 c70003        	ld	_Pro2Cmd+3,a
1558                     ; 392     radio_comm_SendCmdGetResp( SI446X_CMD_ARG_COUNT_GET_PROPERTY,
1558                     ; 393                               Pro2Cmd,
1558                     ; 394                               Pro2Cmd[2],
1558                     ; 395                               Pro2Cmd );
1560  0378 ae0000        	ldw	x,#_Pro2Cmd
1561  037b 89            	pushw	x
1562  037c 3b0002        	push	_Pro2Cmd+2
1563  037f ae0000        	ldw	x,#_Pro2Cmd
1564  0382 89            	pushw	x
1565  0383 a604          	ld	a,#4
1566  0385 8d000000      	callf	f_radio_comm_SendCmdGetResp
1568  0389 5b05          	addw	sp,#5
1569                     ; 397     Si446xCmd.GET_PROPERTY.DATA[0 ]   = Pro2Cmd[0];
1571  038b 5500000010    	mov	_Si446xCmd,_Pro2Cmd
1572                     ; 398     Si446xCmd.GET_PROPERTY.DATA[1 ]   = Pro2Cmd[1];
1574  0390 5500010011    	mov	_Si446xCmd+1,_Pro2Cmd+1
1575                     ; 399     Si446xCmd.GET_PROPERTY.DATA[2 ]   = Pro2Cmd[2];
1577  0395 5500020012    	mov	_Si446xCmd+2,_Pro2Cmd+2
1578                     ; 400     Si446xCmd.GET_PROPERTY.DATA[3 ]   = Pro2Cmd[3];
1580  039a 5500030013    	mov	_Si446xCmd+3,_Pro2Cmd+3
1581                     ; 401     Si446xCmd.GET_PROPERTY.DATA[4 ]   = Pro2Cmd[4];
1583  039f 5500040014    	mov	_Si446xCmd+4,_Pro2Cmd+4
1584                     ; 402     Si446xCmd.GET_PROPERTY.DATA[5 ]   = Pro2Cmd[5];
1586  03a4 5500050015    	mov	_Si446xCmd+5,_Pro2Cmd+5
1587                     ; 403     Si446xCmd.GET_PROPERTY.DATA[6 ]   = Pro2Cmd[6];
1589  03a9 5500060016    	mov	_Si446xCmd+6,_Pro2Cmd+6
1590                     ; 404     Si446xCmd.GET_PROPERTY.DATA[7 ]   = Pro2Cmd[7];
1592  03ae 5500070017    	mov	_Si446xCmd+7,_Pro2Cmd+7
1593                     ; 405     Si446xCmd.GET_PROPERTY.DATA[8 ]   = Pro2Cmd[8];
1595  03b3 5500080018    	mov	_Si446xCmd+8,_Pro2Cmd+8
1596                     ; 406     Si446xCmd.GET_PROPERTY.DATA[9 ]   = Pro2Cmd[9];
1598  03b8 5500090019    	mov	_Si446xCmd+9,_Pro2Cmd+9
1599                     ; 407     Si446xCmd.GET_PROPERTY.DATA[10]   = Pro2Cmd[10];
1601  03bd 55000a001a    	mov	_Si446xCmd+10,_Pro2Cmd+10
1602                     ; 408     Si446xCmd.GET_PROPERTY.DATA[11]   = Pro2Cmd[11];
1604  03c2 55000b001b    	mov	_Si446xCmd+11,_Pro2Cmd+11
1605                     ; 409     Si446xCmd.GET_PROPERTY.DATA[12]   = Pro2Cmd[12];
1607  03c7 55000c001c    	mov	_Si446xCmd+12,_Pro2Cmd+12
1608                     ; 410     Si446xCmd.GET_PROPERTY.DATA[13]   = Pro2Cmd[13];
1610  03cc 55000d001d    	mov	_Si446xCmd+13,_Pro2Cmd+13
1611                     ; 411     Si446xCmd.GET_PROPERTY.DATA[14]   = Pro2Cmd[14];
1613  03d1 55000e001e    	mov	_Si446xCmd+14,_Pro2Cmd+14
1614                     ; 412     Si446xCmd.GET_PROPERTY.DATA[15]   = Pro2Cmd[15];
1616  03d6 55000f001f    	mov	_Si446xCmd+15,_Pro2Cmd+15
1617                     ; 413 }
1620  03db 85            	popw	x
1621  03dc 87            	retf
2505                     	switch	.bss
2506  0000               _Pro2Cmd:
2507  0000 000000000000  	ds.b	16
2508                     	xdef	_Pro2Cmd
2509                     	xref	f_radio_comm_ClearCTS
2510                     	xref	f_radio_comm_SendCmdGetResp
2511                     	xref	f_radio_comm_WriteData
2512                     	xref	f_radio_comm_ReadData
2513                     	xref	f_radio_comm_SendCmd
2514                     	xref	f_radio_hal_NirqLevel
2515                     	xref	f_radio_hal_DeassertShutdown
2516                     	xref	f_radio_hal_AssertShutdown
2517                     	xdef	f_si446x_get_property
2518                     	xdef	f_si446x_read_rx_fifo
2519                     	xdef	f_si446x_write_tx_fifo
2520                     	xdef	f_si446x_fifo_info
2521                     	xdef	f_si446x_nop
2522                     	xdef	f_si446x_get_modem_status
2523                     	xdef	f_si446x_change_state
2524                     	xdef	f_si446x_set_property
2525                     	xdef	f_si446x_gpio_pin_cfg
2526                     	xdef	f_si446x_get_int_status
2527                     	xdef	f_si446x_start_rx
2528                     	xdef	f_si446x_start_tx
2529                     	xdef	f_si446x_part_info
2530                     	xdef	f_si446x_configuration_init
2531                     	xdef	f_si446x_power_up
2532                     	xdef	f_si446x_reset
2533  0010               _Si446xCmd:
2534  0010 000000000000  	ds.b	16
2535                     	xdef	_Si446xCmd
2555                     	end
