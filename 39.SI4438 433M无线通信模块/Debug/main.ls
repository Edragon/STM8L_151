   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	switch	.data
   5  0000               _RfTxBuffer:
   6  0000 00            	dc.b	0
   7  0001 000000000000  	ds.b	63
   8  0040               _RfRxBuffer:
   9  0040 00            	dc.b	0
  10  0041 000000000000  	ds.b	63
  11  0080               _ChannelNumber:
  12  0080 00            	dc.b	0
  13  0081               _bRF_IT_Status:
  14  0081 00            	dc.b	0
  15  0082               _Send_Ok:
  16  0082 00            	dc.b	0
  17  0083               _rssi:
  18  0083 00            	dc.b	0
  58                     ; 25 void Delay(__IO uint16_t nCount)
  58                     ; 26 {
  59                     	switch	.text
  60  0000               f_Delay:
  62  0000 89            	pushw	x
  63       00000000      OFST:	set	0
  66  0001 2007          	jra	L13
  67  0003               L72:
  68                     ; 30         nCount--;
  70  0003 1e01          	ldw	x,(OFST+1,sp)
  71  0005 1d0001        	subw	x,#1
  72  0008 1f01          	ldw	(OFST+1,sp),x
  73  000a               L13:
  74                     ; 28     while (nCount != 0)
  76  000a 1e01          	ldw	x,(OFST+1,sp)
  77  000c 26f5          	jrne	L72
  78                     ; 32 } 
  81  000e 85            	popw	x
  82  000f 87            	retf
 105                     ; 39 void LED_ON(void)
 105                     ; 40 {
 106                     	switch	.text
 107  0010               f_LED_ON:
 111                     ; 41    GPIO_ResetBits(LED_PORT,LED_PINS);
 113  0010 4b10          	push	#16
 114  0012 ae500a        	ldw	x,#20490
 115  0015 8d000000      	callf	f_GPIO_ResetBits
 117  0019 84            	pop	a
 118                     ; 42 }
 121  001a 87            	retf
 144                     ; 49 void LED_OFF(void)
 144                     ; 50 {
 145                     	switch	.text
 146  001b               f_LED_OFF:
 150                     ; 51   GPIO_SetBits(LED_PORT,LED_PINS);
 152  001b 4b10          	push	#16
 153  001d ae500a        	ldw	x,#20490
 154  0020 8d000000      	callf	f_GPIO_SetBits
 156  0024 84            	pop	a
 157                     ; 52 }
 160  0025 87            	retf
 208                     ; 61 void main(void)
 208                     ; 62 {
 209                     	switch	.text
 210  0026               f_main:
 212  0026 88            	push	a
 213       00000001      OFST:	set	1
 216                     ; 63     u8 KEY_FLAG=0;//按键按下与否标识
 218  0027 0f01          	clr	(OFST+0,sp)
 219                     ; 65     GPIO_Init(LED_PORT,LED_PINS,GPIO_Mode_Out_PP_Low_Slow);//初始化LED端口
 221  0029 4bc0          	push	#192
 222  002b 4b10          	push	#16
 223  002d ae500a        	ldw	x,#20490
 224  0030 8d000000      	callf	f_GPIO_Init
 226  0034 85            	popw	x
 227                     ; 66     GPIO_Init(KEY_PORT,KEY_PINS,GPIO_Mode_In_PU_No_IT);    //初始化按键端口，带上拉无中断
 229  0035 4b40          	push	#64
 230  0037 4b10          	push	#16
 231  0039 ae500f        	ldw	x,#20495
 232  003c 8d000000      	callf	f_GPIO_Init
 234  0040 85            	popw	x
 235                     ; 67     LED_OFF();                                             //关闭LED
 237  0041 8d1b001b      	callf	f_LED_OFF
 239                     ; 69     MCU_PinInit();//单片机与模块的接口初始化
 241  0045 8d000000      	callf	f_MCU_PinInit
 243                     ; 70     vRadio_Init();//模块初始化,默认空中速率9600
 245  0049 8d000000      	callf	f_vRadio_Init
 247                     ; 72     vRadio_StartRX(ChannelNumber,6);//接收模式	
 249  004d ae0006        	ldw	x,#6
 250  0050 c60080        	ld	a,_ChannelNumber
 251  0053 95            	ld	xh,a
 252  0054 8d000000      	callf	f_vRadio_StartRX
 254  0058               L77:
 255                     ; 76         if((KEY_FLAG!=1)&&(GPIO_ReadInputDataBit(KEY_PORT,KEY_PINS)==0))
 257  0058 7b01          	ld	a,(OFST+0,sp)
 258  005a a101          	cp	a,#1
 259  005c 276c          	jreq	L301
 261  005e 4b10          	push	#16
 262  0060 ae500f        	ldw	x,#20495
 263  0063 8d000000      	callf	f_GPIO_ReadInputDataBit
 265  0067 5b01          	addw	sp,#1
 266  0069 4d            	tnz	a
 267  006a 265e          	jrne	L301
 268                     ; 78             Delay(5000);
 270  006c ae1388        	ldw	x,#5000
 271  006f 8d000000      	callf	f_Delay
 273                     ; 79             if(GPIO_ReadInputDataBit(KEY_PORT,KEY_PINS)==0)   //按键软件防抖
 275  0073 4b10          	push	#16
 276  0075 ae500f        	ldw	x,#20495
 277  0078 8d000000      	callf	f_GPIO_ReadInputDataBit
 279  007c 5b01          	addw	sp,#1
 280  007e 4d            	tnz	a
 281  007f 2649          	jrne	L301
 282                     ; 81                 KEY_FLAG=1;
 284  0081 a601          	ld	a,#1
 285  0083 6b01          	ld	(OFST+0,sp),a
 286                     ; 82                 LED_ON();
 288  0085 8d100010      	callf	f_LED_ON
 290                     ; 83                 RfTxBuffer[0]=0xF0;
 292  0089 35f00000      	mov	_RfTxBuffer,#240
 293                     ; 84                 RfTxBuffer[1]=0x2D;
 295  008d 352d0001      	mov	_RfTxBuffer+1,#45
 296                     ; 85                 RfTxBuffer[2]=0xD4;
 298  0091 35d40002      	mov	_RfTxBuffer+2,#212
 299                     ; 86                 RfTxBuffer[3]=0xA5;
 301  0095 35a50003      	mov	_RfTxBuffer+3,#165
 302                     ; 87                 RfTxBuffer[4]=0x01;
 304  0099 35010004      	mov	_RfTxBuffer+4,#1
 305                     ; 88                 RfTxBuffer[5]=0x22;
 307  009d 35220005      	mov	_RfTxBuffer+5,#34
 308                     ; 89                 RfTxBuffer[6]=0xD4;
 310  00a1 35d40006      	mov	_RfTxBuffer+6,#212
 311                     ; 90                 RfTxBuffer[7]=0xA5;
 313  00a5 35a50007      	mov	_RfTxBuffer+7,#165
 314                     ; 91                 RfTxBuffer[8]=0x12;
 316  00a9 35120008      	mov	_RfTxBuffer+8,#18
 317                     ; 92                 RfTxBuffer[9]=0x22;
 319  00ad 35220009      	mov	_RfTxBuffer+9,#34
 320                     ; 93                 if(Send_Ok==0)
 322  00b1 725d0082      	tnz	_Send_Ok
 323  00b5 2613          	jrne	L301
 324                     ; 95                     vRadio_StartTx_Variable_Packet(ChannelNumber, &RfTxBuffer[0],6);
 326  00b7 4b06          	push	#6
 327  00b9 ae0000        	ldw	x,#_RfTxBuffer
 328  00bc 89            	pushw	x
 329  00bd c60080        	ld	a,_ChannelNumber
 330  00c0 8d000000      	callf	f_vRadio_StartTx_Variable_Packet
 332  00c4 5b03          	addw	sp,#3
 333                     ; 97                     Send_Ok=1;
 335  00c6 35010082      	mov	_Send_Ok,#1
 336  00ca               L301:
 337                     ; 103             if((KEY_FLAG!=0)&&(GPIO_ReadInputDataBit(KEY_PORT,KEY_PINS)!=0))
 339  00ca 0d01          	tnz	(OFST+0,sp)
 340  00cc 2729          	jreq	L111
 342  00ce 4b10          	push	#16
 343  00d0 ae500f        	ldw	x,#20495
 344  00d3 8d000000      	callf	f_GPIO_ReadInputDataBit
 346  00d7 5b01          	addw	sp,#1
 347  00d9 4d            	tnz	a
 348  00da 271b          	jreq	L111
 349                     ; 105                 Delay(5000);
 351  00dc ae1388        	ldw	x,#5000
 352  00df 8d000000      	callf	f_Delay
 354                     ; 106                 if(GPIO_ReadInputDataBit(KEY_PORT,KEY_PINS)!=0) //按键软件防抖
 356  00e3 4b10          	push	#16
 357  00e5 ae500f        	ldw	x,#20495
 358  00e8 8d000000      	callf	f_GPIO_ReadInputDataBit
 360  00ec 5b01          	addw	sp,#1
 361  00ee 4d            	tnz	a
 362  00ef 2706          	jreq	L111
 363                     ; 108                     KEY_FLAG=0;
 365  00f1 0f01          	clr	(OFST+0,sp)
 366                     ; 109                     LED_OFF();
 368  00f3 8d1b001b      	callf	f_LED_OFF
 370  00f7               L111:
 371                     ; 114             bRF_IT_Status = bRadio_Check_Tx_RX();//读取中断状态并返回值
 373  00f7 8d000000      	callf	f_bRadio_Check_Tx_RX
 375  00fb c70081        	ld	_bRF_IT_Status,a
 376                     ; 115             switch (bRF_IT_Status)
 378  00fe c60081        	ld	a,_bRF_IT_Status
 380                     ; 145                 default:
 380                     ; 146                 break;
 381  0101 a010          	sub	a,#16
 382  0103 271f          	jreq	L75
 383  0105 a010          	sub	a,#16
 384  0107 2704          	jreq	L41
 385  0109 ac580058      	jpf	L77
 386  010d               L41:
 387                     ; 118                 case SI446X_CMD_GET_INT_STATUS_REP_PH_PEND_PACKET_SENT_PEND_BIT:
 387                     ; 119                       vRadio_Tx_TO_Rx();
 389  010d 8d000000      	callf	f_vRadio_Tx_TO_Rx
 391                     ; 121                       vRadio_StartRX(ChannelNumber, 6);
 393  0111 ae0006        	ldw	x,#6
 394  0114 c60080        	ld	a,_ChannelNumber
 395  0117 95            	ld	xh,a
 396  0118 8d000000      	callf	f_vRadio_StartRX
 398                     ; 122                       Send_Ok=0;
 400  011c 725f0082      	clr	_Send_Ok
 401                     ; 124 	        break;
 403  0120 ac580058      	jpf	L77
 404  0124               L75:
 405                     ; 126                 case SI446X_CMD_GET_INT_STATUS_REP_PH_PEND_PACKET_RX_PEND_BIT:
 405                     ; 127               
 405                     ; 128                       if(Si446xCmd.FIFO_INFO.RX_FIFO_COUNT>0)//如果接收到的数据大于0
 407  0124 725d0000      	tnz	_Si446xCmd
 408  0128 2604          	jrne	L61
 409  012a ac580058      	jpf	L77
 410  012e               L61:
 411                     ; 130                           if((RfRxBuffer[0]==0xF0)&&(RfRxBuffer[1]==0x2D)&&(RfRxBuffer[2]==0xD4)&&(RfRxBuffer[3]==0xA5)&&(RfRxBuffer[4]==0x01))//判断数据正确与否
 413  012e c60040        	ld	a,_RfRxBuffer
 414  0131 a1f0          	cp	a,#240
 415  0133 263a          	jrne	L321
 417  0135 c60041        	ld	a,_RfRxBuffer+1
 418  0138 a12d          	cp	a,#45
 419  013a 2633          	jrne	L321
 421  013c c60042        	ld	a,_RfRxBuffer+2
 422  013f a1d4          	cp	a,#212
 423  0141 262c          	jrne	L321
 425  0143 c60043        	ld	a,_RfRxBuffer+3
 426  0146 a1a5          	cp	a,#165
 427  0148 2625          	jrne	L321
 429  014a c60044        	ld	a,_RfRxBuffer+4
 430  014d a101          	cp	a,#1
 431  014f 261e          	jrne	L321
 432                     ; 133                               LED_ON();
 434  0151 8d100010      	callf	f_LED_ON
 436                     ; 134                               Delay(5000);
 438  0155 ae1388        	ldw	x,#5000
 439  0158 8d000000      	callf	f_Delay
 441                     ; 135                               LED_OFF();
 443  015c 8d1b001b      	callf	f_LED_OFF
 445                     ; 136                               vRadio_StartRX(ChannelNumber, 6);
 447  0160 ae0006        	ldw	x,#6
 448  0163 c60080        	ld	a,_ChannelNumber
 449  0166 95            	ld	xh,a
 450  0167 8d000000      	callf	f_vRadio_StartRX
 453  016b ac580058      	jpf	L77
 454  016f               L321:
 455                     ; 141                               vRadio_StartRX(ChannelNumber, 6);
 457  016f ae0006        	ldw	x,#6
 458  0172 c60080        	ld	a,_ChannelNumber
 459  0175 95            	ld	xh,a
 460  0176 8d000000      	callf	f_vRadio_StartRX
 462  017a ac580058      	jpf	L77
 463  017e               L16:
 464                     ; 145                 default:
 464                     ; 146                 break;
 466  017e ac580058      	jpf	L77
 467  0182               L711:
 469  0182 ac580058      	jpf	L77
 538                     	xdef	f_main
 539                     	xdef	f_LED_OFF
 540                     	xdef	f_LED_ON
 541                     	xdef	f_Delay
 542                     	xdef	_Send_Ok
 543                     	xdef	_bRF_IT_Status
 544                     	xdef	_ChannelNumber
 545                     	xdef	_RfTxBuffer
 546                     	xdef	_rssi
 547                     	switch	.bss
 548  0000               _ucPackLgth:
 549  0000 00            	ds.b	1
 550                     	xdef	_ucPackLgth
 551                     	xdef	_RfRxBuffer
 552                     	xref	f_MCU_PinInit
 553                     	xref	f_vRadio_Tx_TO_Rx
 554                     	xref	f_vRadio_StartTx_Variable_Packet
 555                     	xref	f_vRadio_StartRX
 556                     	xref	f_bRadio_Check_Tx_RX
 557                     	xref	f_vRadio_Init
 558                     	xref	_Si446xCmd
 559                     	xref	f_GPIO_ReadInputDataBit
 560                     	xref	f_GPIO_ResetBits
 561                     	xref	f_GPIO_SetBits
 562                     	xref	f_GPIO_Init
 582                     	end
