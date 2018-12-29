   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	switch	.data
   5  0000               _ctsWentHigh:
   6  0000 00            	dc.b	0
  74                     ; 51 u8 radio_comm_GetResp(u8 byteCount, u8* pData)
  74                     ; 52 {
  75                     	switch	.text
  76  0000               f_radio_comm_GetResp:
  78  0000 88            	push	a
  79  0001 5203          	subw	sp,#3
  80       00000003      OFST:	set	3
  83                     ; 55   u16 errCnt = 10000;
  85  0003 ae2710        	ldw	x,#10000
  86  0006 1f01          	ldw	(OFST-2,sp),x
  87                     ; 56   u8  ctsVal = 100;
  89  0008 a664          	ld	a,#100
  90  000a 6b03          	ld	(OFST+0,sp),a
  92  000c 2039          	jra	L14
  93  000e               L53:
  94                     ; 59     radio_hal_ClearNsel();
  96  000e 8d000000      	callf	f_radio_hal_ClearNsel
  98                     ; 60     radio_hal_SpiWriteByte(0x44);    //read CMD buffer
 100  0012 a644          	ld	a,#68
 101  0014 8d000000      	callf	f_radio_hal_SpiWriteByte
 103                     ; 61     ctsVal = radio_hal_SpiReadByte();
 105  0018 8d000000      	callf	f_radio_hal_SpiReadByte
 107  001c 6b03          	ld	(OFST+0,sp),a
 108                     ; 62     if (ctsVal == 0xFF)
 110  001e 7b03          	ld	a,(OFST+0,sp)
 111  0020 a1ff          	cp	a,#255
 112  0022 2618          	jrne	L54
 113                     ; 64       if (byteCount)
 115  0024 0d04          	tnz	(OFST+1,sp)
 116  0026 270a          	jreq	L74
 117                     ; 66         radio_hal_SpiReadData(byteCount, pData);
 119  0028 1e08          	ldw	x,(OFST+5,sp)
 120  002a 89            	pushw	x
 121  002b 7b06          	ld	a,(OFST+3,sp)
 122  002d 8d000000      	callf	f_radio_hal_SpiReadData
 124  0031 85            	popw	x
 125  0032               L74:
 126                     ; 68       radio_hal_SetNsel();
 128  0032 8d000000      	callf	f_radio_hal_SetNsel
 130                     ; 69       break;
 131  0036               L34:
 132                     ; 75   if (errCnt == 0)
 134  0036 1e01          	ldw	x,(OFST-2,sp)
 135  0038 2613          	jrne	L15
 136  003a               L35:
 138  003a 20fe          	jra	L35
 139  003c               L54:
 140                     ; 71     radio_hal_SetNsel();
 142  003c 8d000000      	callf	f_radio_hal_SetNsel
 144                     ; 72     errCnt--;
 146  0040 1e01          	ldw	x,(OFST-2,sp)
 147  0042 1d0001        	subw	x,#1
 148  0045 1f01          	ldw	(OFST-2,sp),x
 149  0047               L14:
 150                     ; 57   while (errCnt != 0)      //wait until radio IC is ready with the data
 152  0047 1e01          	ldw	x,(OFST-2,sp)
 153  0049 26c3          	jrne	L53
 154  004b 20e9          	jra	L34
 155  004d               L15:
 156                     ; 86   if (ctsVal == 0xFF)
 158  004d 7b03          	ld	a,(OFST+0,sp)
 159  004f a1ff          	cp	a,#255
 160  0051 2604          	jrne	L75
 161                     ; 88     ctsWentHigh = 1;
 163  0053 35010000      	mov	_ctsWentHigh,#1
 164  0057               L75:
 165                     ; 91   return ctsVal;
 167  0057 7b03          	ld	a,(OFST+0,sp)
 170  0059 5b04          	addw	sp,#4
 171  005b 87            	retf
 217                     ; 100 void radio_comm_SendCmd(u8 byteCount, u8* pData)
 217                     ; 101 {
 218                     	switch	.text
 219  005c               f_radio_comm_SendCmd:
 221  005c 88            	push	a
 222       00000000      OFST:	set	0
 225  005d 2004          	jra	L301
 226  005f               L101:
 227                     ; 104         radio_comm_PollCTS();
 229  005f 8ddf00df      	callf	f_radio_comm_PollCTS
 231  0063               L301:
 232                     ; 102     while (!ctsWentHigh)
 234  0063 725d0000      	tnz	_ctsWentHigh
 235  0067 27f6          	jreq	L101
 236                     ; 106     radio_hal_ClearNsel();
 238  0069 8d000000      	callf	f_radio_hal_ClearNsel
 240                     ; 107     radio_hal_SpiWriteData(byteCount, pData);
 242  006d 1e05          	ldw	x,(OFST+5,sp)
 243  006f 89            	pushw	x
 244  0070 7b03          	ld	a,(OFST+3,sp)
 245  0072 8d000000      	callf	f_radio_hal_SpiWriteData
 247  0076 85            	popw	x
 248                     ; 108     radio_hal_SetNsel();
 250  0077 8d000000      	callf	f_radio_hal_SetNsel
 252                     ; 109     ctsWentHigh = 0;
 254  007b 725f0000      	clr	_ctsWentHigh
 255                     ; 110 }
 258  007f 84            	pop	a
 259  0080 87            	retf
 321                     ; 120 void radio_comm_ReadData(u8 cmd, u8 pollCts, u8 byteCount, u8* pData)
 321                     ; 121 {
 322                     	switch	.text
 323  0081               f_radio_comm_ReadData:
 325  0081 89            	pushw	x
 326       00000000      OFST:	set	0
 329                     ; 122     if(pollCts)
 331  0082 9f            	ld	a,xl
 332  0083 4d            	tnz	a
 333  0084 270c          	jreq	L331
 335  0086 2004          	jra	L731
 336  0088               L531:
 337                     ; 126             radio_comm_PollCTS();
 339  0088 8ddf00df      	callf	f_radio_comm_PollCTS
 341  008c               L731:
 342                     ; 124         while(!ctsWentHigh)
 344  008c 725d0000      	tnz	_ctsWentHigh
 345  0090 27f6          	jreq	L531
 346  0092               L331:
 347                     ; 129     radio_hal_ClearNsel();
 349  0092 8d000000      	callf	f_radio_hal_ClearNsel
 351                     ; 130     radio_hal_SpiWriteByte(cmd);
 353  0096 7b01          	ld	a,(OFST+1,sp)
 354  0098 8d000000      	callf	f_radio_hal_SpiWriteByte
 356                     ; 131     radio_hal_SpiReadData(byteCount, pData);
 358  009c 1e07          	ldw	x,(OFST+7,sp)
 359  009e 89            	pushw	x
 360  009f 7b08          	ld	a,(OFST+8,sp)
 361  00a1 8d000000      	callf	f_radio_hal_SpiReadData
 363  00a5 85            	popw	x
 364                     ; 132     radio_hal_SetNsel();
 366  00a6 8d000000      	callf	f_radio_hal_SetNsel
 368                     ; 133     ctsWentHigh = 0;
 370  00aa 725f0000      	clr	_ctsWentHigh
 371                     ; 134 }
 374  00ae 85            	popw	x
 375  00af 87            	retf
 437                     ; 145 void radio_comm_WriteData(u8 cmd, u8 pollCts, u8 byteCount, u8* pData)
 437                     ; 146 {
 438                     	switch	.text
 439  00b0               f_radio_comm_WriteData:
 441  00b0 89            	pushw	x
 442       00000000      OFST:	set	0
 445                     ; 147     if(pollCts)
 447  00b1 9f            	ld	a,xl
 448  00b2 4d            	tnz	a
 449  00b3 270c          	jreq	L761
 451  00b5 2004          	jra	L371
 452  00b7               L171:
 453                     ; 151             radio_comm_PollCTS();
 455  00b7 8ddf00df      	callf	f_radio_comm_PollCTS
 457  00bb               L371:
 458                     ; 149         while(!ctsWentHigh)
 460  00bb 725d0000      	tnz	_ctsWentHigh
 461  00bf 27f6          	jreq	L171
 462  00c1               L761:
 463                     ; 154     radio_hal_ClearNsel();
 465  00c1 8d000000      	callf	f_radio_hal_ClearNsel
 467                     ; 155     radio_hal_SpiWriteByte(cmd);
 469  00c5 7b01          	ld	a,(OFST+1,sp)
 470  00c7 8d000000      	callf	f_radio_hal_SpiWriteByte
 472                     ; 156     radio_hal_SpiWriteData(byteCount, pData);
 474  00cb 1e07          	ldw	x,(OFST+7,sp)
 475  00cd 89            	pushw	x
 476  00ce 7b08          	ld	a,(OFST+8,sp)
 477  00d0 8d000000      	callf	f_radio_hal_SpiWriteData
 479  00d4 85            	popw	x
 480                     ; 157     radio_hal_SetNsel();
 482  00d5 8d000000      	callf	f_radio_hal_SetNsel
 484                     ; 158     ctsWentHigh = 0;
 486  00d9 725f0000      	clr	_ctsWentHigh
 487                     ; 159 }
 490  00dd 85            	popw	x
 491  00de 87            	retf
 514                     ; 166 u8 radio_comm_PollCTS(void)
 514                     ; 167 {
 515                     	switch	.text
 516  00df               f_radio_comm_PollCTS:
 520                     ; 176     return radio_comm_GetResp(0, 0);
 522  00df 5f            	clrw	x
 523  00e0 89            	pushw	x
 524  00e1 4f            	clr	a
 525  00e2 8d000000      	callf	f_radio_comm_GetResp
 527  00e6 85            	popw	x
 530  00e7 87            	retf
 554                     ; 183 void radio_comm_ClearCTS()
 554                     ; 184 {
 555                     	switch	.text
 556  00e8               f_radio_comm_ClearCTS:
 560                     ; 185   ctsWentHigh = 0;
 562  00e8 725f0000      	clr	_ctsWentHigh
 563                     ; 186 }
 566  00ec 87            	retf
 627                     ; 242 u8 radio_comm_SendCmdGetResp(u8 cmdByteCount, u8* pCmdData, u8 respByteCount, u8* pRespData)
 627                     ; 243 {
 628                     	switch	.text
 629  00ed               f_radio_comm_SendCmdGetResp:
 631  00ed 88            	push	a
 632       00000000      OFST:	set	0
 635                     ; 244     radio_comm_SendCmd(cmdByteCount, pCmdData);
 637  00ee 1e05          	ldw	x,(OFST+5,sp)
 638  00f0 89            	pushw	x
 639  00f1 8d5c005c      	callf	f_radio_comm_SendCmd
 641  00f5 85            	popw	x
 642                     ; 245     return radio_comm_GetResp(respByteCount, pRespData);
 644  00f6 1e08          	ldw	x,(OFST+8,sp)
 645  00f8 89            	pushw	x
 646  00f9 7b09          	ld	a,(OFST+9,sp)
 647  00fb 8d000000      	callf	f_radio_comm_GetResp
 649  00ff 85            	popw	x
 652  0100 5b01          	addw	sp,#1
 653  0102 87            	retf
 674                     	xdef	_ctsWentHigh
 675                     	xdef	f_radio_comm_ClearCTS
 676                     	xdef	f_radio_comm_SendCmdGetResp
 677                     	xdef	f_radio_comm_PollCTS
 678                     	xdef	f_radio_comm_WriteData
 679                     	xdef	f_radio_comm_ReadData
 680                     	xdef	f_radio_comm_SendCmd
 681                     	xdef	f_radio_comm_GetResp
 682                     	xref	f_radio_hal_SpiReadData
 683                     	xref	f_radio_hal_SpiWriteData
 684                     	xref	f_radio_hal_SpiReadByte
 685                     	xref	f_radio_hal_SpiWriteByte
 686                     	xref	f_radio_hal_SetNsel
 687                     	xref	f_radio_hal_ClearNsel
 706                     	end
