   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  35                     ; 19 void InitIIC(void)
  35                     ; 20 {
  37                     	switch	.text
  38  0000               _InitIIC:
  42                     ; 21   I2C_DeInit(I2C1);
  44  0000 ae5210        	ldw	x,#21008
  45  0003 cd0000        	call	_I2C_DeInit
  47                     ; 22   I2C_Init(I2C1,IICSPEED, EEPROM_ADDRESS, I2C_Mode_I2C,I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  49  0006 4b00          	push	#0
  50  0008 4b04          	push	#4
  51  000a 4b00          	push	#0
  52  000c 4b00          	push	#0
  53  000e ae00a0        	ldw	x,#160
  54  0011 89            	pushw	x
  55  0012 ae86a0        	ldw	x,#34464
  56  0015 89            	pushw	x
  57  0016 ae0001        	ldw	x,#1
  58  0019 89            	pushw	x
  59  001a ae5210        	ldw	x,#21008
  60  001d cd0000        	call	_I2C_Init
  62  0020 5b0a          	addw	sp,#10
  63                     ; 23   I2C_Cmd(I2C1,ENABLE);
  65  0022 4b01          	push	#1
  66  0024 ae5210        	ldw	x,#21008
  67  0027 cd0000        	call	_I2C_Cmd
  69  002a 84            	pop	a
  70                     ; 24 }
  73  002b 81            	ret
 107                     ; 35 void WaiteI2C_SDA_Idle(void )
 107                     ; 36 {
 108                     	switch	.text
 109  002c               _WaiteI2C_SDA_Idle:
 111  002c 89            	pushw	x
 112       00000002      OFST:	set	2
 115                     ; 37   unsigned int nCount=0xfff;
 117  002d ae0fff        	ldw	x,#4095
 118  0030 1f01          	ldw	(OFST-1,sp),x
 119  0032               L73:
 120                     ; 41     nCount--;
 122  0032 1e01          	ldw	x,(OFST-1,sp)
 123  0034 1d0001        	subw	x,#1
 124  0037 1f01          	ldw	(OFST-1,sp),x
 125                     ; 39   while (nCount != 0)
 127  0039 1e01          	ldw	x,(OFST-1,sp)
 128  003b 26f5          	jrne	L73
 129                     ; 43 }
 132  003d 85            	popw	x
 133  003e 81            	ret
 194                     ; 54 void EEPROM_WriteOnePage(unsigned char *buffer,unsigned char addr,unsigned char num)
 194                     ; 55 {
 195                     	switch	.text
 196  003f               _EEPROM_WriteOnePage:
 198  003f 89            	pushw	x
 199       00000000      OFST:	set	0
 202  0040               L57:
 203                     ; 57     while(I2C_GetFlagStatus(I2C1,I2C_FLAG_BUSY));
 205  0040 ae0302        	ldw	x,#770
 206  0043 89            	pushw	x
 207  0044 ae5210        	ldw	x,#21008
 208  0047 cd0000        	call	_I2C_GetFlagStatus
 210  004a 85            	popw	x
 211  004b 4d            	tnz	a
 212  004c 26f2          	jrne	L57
 213                     ; 60     I2C_GenerateSTART(I2C1,ENABLE);
 215  004e 4b01          	push	#1
 216  0050 ae5210        	ldw	x,#21008
 217  0053 cd0000        	call	_I2C_GenerateSTART
 219  0056 84            	pop	a
 221  0057               L301:
 222                     ; 63     while(!I2C_CheckEvent(I2C1,I2C_EVENT_MASTER_MODE_SELECT)); 
 224  0057 ae0301        	ldw	x,#769
 225  005a 89            	pushw	x
 226  005b ae5210        	ldw	x,#21008
 227  005e cd0000        	call	_I2C_CheckEvent
 229  0061 85            	popw	x
 230  0062 4d            	tnz	a
 231  0063 27f2          	jreq	L301
 232                     ; 66     I2C_Send7bitAddress(I2C1,EEPROM_ADDRESS, I2C_Direction_Transmitter);
 234  0065 4b00          	push	#0
 235  0067 4ba0          	push	#160
 236  0069 ae5210        	ldw	x,#21008
 237  006c cd0000        	call	_I2C_Send7bitAddress
 239  006f 85            	popw	x
 241  0070               L111:
 242                     ; 69   while(!I2C_CheckEvent(I2C1,I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
 244  0070 ae0302        	ldw	x,#770
 245  0073 89            	pushw	x
 246  0074 ae5210        	ldw	x,#21008
 247  0077 cd0000        	call	_I2C_CheckEvent
 249  007a 85            	popw	x
 250  007b 4d            	tnz	a
 251  007c 27f2          	jreq	L111
 252                     ; 72     I2C_SendData(I2C1,(u8)(addr)); 
 254  007e 7b05          	ld	a,(OFST+5,sp)
 255  0080 88            	push	a
 256  0081 ae5210        	ldw	x,#21008
 257  0084 cd0000        	call	_I2C_SendData
 259  0087 84            	pop	a
 261  0088               L711:
 262                     ; 74     while (!I2C_CheckEvent(I2C1,I2C_EVENT_MASTER_BYTE_TRANSMITTING));  
 264  0088 ae0780        	ldw	x,#1920
 265  008b 89            	pushw	x
 266  008c ae5210        	ldw	x,#21008
 267  008f cd0000        	call	_I2C_CheckEvent
 269  0092 85            	popw	x
 270  0093 4d            	tnz	a
 271  0094 27f2          	jreq	L711
 273  0096 2029          	jra	L521
 274  0098               L321:
 275                     ; 80       I2C_SendData(I2C1,*buffer); 
 277  0098 1e01          	ldw	x,(OFST+1,sp)
 278  009a f6            	ld	a,(x)
 279  009b 88            	push	a
 280  009c ae5210        	ldw	x,#21008
 281  009f cd0000        	call	_I2C_SendData
 283  00a2 84            	pop	a
 284                     ; 83       buffer++; 
 286  00a3 1e01          	ldw	x,(OFST+1,sp)
 287  00a5 1c0001        	addw	x,#1
 288  00a8 1f01          	ldw	(OFST+1,sp),x
 290  00aa               L331:
 291                     ; 86      while (!I2C_CheckEvent(I2C1,I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 293  00aa ae0784        	ldw	x,#1924
 294  00ad 89            	pushw	x
 295  00ae ae5210        	ldw	x,#21008
 296  00b1 cd0000        	call	_I2C_CheckEvent
 298  00b4 85            	popw	x
 299  00b5 4d            	tnz	a
 300  00b6 27f2          	jreq	L331
 301                     ; 87       I2C_AcknowledgeConfig(I2C1,ENABLE);
 303  00b8 4b01          	push	#1
 304  00ba ae5210        	ldw	x,#21008
 305  00bd cd0000        	call	_I2C_AcknowledgeConfig
 307  00c0 84            	pop	a
 308  00c1               L521:
 309                     ; 77     while(num--)  
 311  00c1 7b06          	ld	a,(OFST+6,sp)
 312  00c3 0a06          	dec	(OFST+6,sp)
 313  00c5 4d            	tnz	a
 314  00c6 26d0          	jrne	L321
 315                     ; 91     I2C_GenerateSTOP(I2C1,ENABLE);
 317  00c8 4b01          	push	#1
 318  00ca ae5210        	ldw	x,#21008
 319  00cd cd0000        	call	_I2C_GenerateSTOP
 321  00d0 84            	pop	a
 322                     ; 92 }
 325  00d1 85            	popw	x
 326  00d2 81            	ret
 426                     ; 102 void EEPROM_WriteData(unsigned char *buffer,unsigned char addr,unsigned char num)
 426                     ; 103 {
 427                     	switch	.text
 428  00d3               _EEPROM_WriteData:
 430  00d3 89            	pushw	x
 431  00d4 5206          	subw	sp,#6
 432       00000006      OFST:	set	6
 435                     ; 104   u8 NumOfPage = 0, NumOfSingle = 0, Addr = 0, count = 0, temp = 0;
 437  00d6 7b05          	ld	a,(OFST-1,sp)
 438  00d8 97            	ld	xl,a
 441  00d9 7b04          	ld	a,(OFST-2,sp)
 442  00db 97            	ld	xl,a
 445  00dc 7b03          	ld	a,(OFST-3,sp)
 446  00de 97            	ld	xl,a
 449  00df 7b06          	ld	a,(OFST+0,sp)
 450  00e1 97            	ld	xl,a
 453  00e2 7b03          	ld	a,(OFST-3,sp)
 454  00e4 97            	ld	xl,a
 455                     ; 106   Addr = addr % EEPROM_Page_Byte_Size;/*不满一页的开始写的地址*/
 457  00e5 7b0b          	ld	a,(OFST+5,sp)
 458  00e7 a407          	and	a,#7
 459  00e9 6b03          	ld	(OFST-3,sp),a
 460                     ; 107   count = EEPROM_Page_Byte_Size - Addr;/*不满一页的地址剩余容量*/
 462  00eb a608          	ld	a,#8
 463  00ed 1003          	sub	a,(OFST-3,sp)
 464  00ef 6b06          	ld	(OFST+0,sp),a
 465                     ; 108   NumOfPage =  num / EEPROM_Page_Byte_Size;/*写了完整的页数*/
 467  00f1 7b0c          	ld	a,(OFST+6,sp)
 468  00f3 44            	srl	a
 469  00f4 44            	srl	a
 470  00f5 44            	srl	a
 471  00f6 6b05          	ld	(OFST-1,sp),a
 472                     ; 109   NumOfSingle = num % EEPROM_Page_Byte_Size;/*写完完整页剩余的容量*/
 474  00f8 7b0c          	ld	a,(OFST+6,sp)
 475  00fa a407          	and	a,#7
 476  00fc 6b04          	ld	(OFST-2,sp),a
 477                     ; 112   if(Addr == 0){ 
 479  00fe 0d03          	tnz	(OFST-3,sp)
 480  0100 2647          	jrne	L112
 481                     ; 114     if(NumOfPage == 0) 
 483  0102 0d05          	tnz	(OFST-1,sp)
 484  0104 262a          	jrne	L122
 485                     ; 115       EEPROM_WriteOnePage(buffer, addr, NumOfSingle);
 487  0106 7b04          	ld	a,(OFST-2,sp)
 488  0108 88            	push	a
 489  0109 7b0c          	ld	a,(OFST+6,sp)
 490  010b 88            	push	a
 491  010c 1e09          	ldw	x,(OFST+3,sp)
 492  010e cd003f        	call	_EEPROM_WriteOnePage
 494  0111 85            	popw	x
 496  0112 cc0195        	jra	L722
 497  0115               L712:
 498                     ; 120         EEPROM_WriteOnePage(buffer, addr, EEPROM_Page_Byte_Size ); /*写一页*/
 500  0115 4b08          	push	#8
 501  0117 7b0c          	ld	a,(OFST+6,sp)
 502  0119 88            	push	a
 503  011a 1e09          	ldw	x,(OFST+3,sp)
 504  011c cd003f        	call	_EEPROM_WriteOnePage
 506  011f 85            	popw	x
 507                     ; 121         addr +=  EEPROM_Page_Byte_Size ;
 509  0120 7b0b          	ld	a,(OFST+5,sp)
 510  0122 ab08          	add	a,#8
 511  0124 6b0b          	ld	(OFST+5,sp),a
 512                     ; 122         buffer+= EEPROM_Page_Byte_Size ;
 514  0126 1e07          	ldw	x,(OFST+1,sp)
 515  0128 1c0008        	addw	x,#8
 516  012b 1f07          	ldw	(OFST+1,sp),x
 517                     ; 123         WaiteI2C_SDA_Idle();
 519  012d cd002c        	call	_WaiteI2C_SDA_Idle
 521  0130               L122:
 522                     ; 119       while(NumOfPage--){
 524  0130 7b05          	ld	a,(OFST-1,sp)
 525  0132 0a05          	dec	(OFST-1,sp)
 526  0134 4d            	tnz	a
 527  0135 26de          	jrne	L712
 528                     ; 125       if(NumOfSingle!=0){/*写尾数*/
 530  0137 0d04          	tnz	(OFST-2,sp)
 531  0139 275a          	jreq	L722
 532                     ; 126         EEPROM_WriteOnePage(buffer, addr, NumOfSingle);
 534  013b 7b04          	ld	a,(OFST-2,sp)
 535  013d 88            	push	a
 536  013e 7b0c          	ld	a,(OFST+6,sp)
 537  0140 88            	push	a
 538  0141 1e09          	ldw	x,(OFST+3,sp)
 539  0143 cd003f        	call	_EEPROM_WriteOnePage
 541  0146 85            	popw	x
 542  0147 204c          	jra	L722
 543  0149               L112:
 544                     ; 133     if (NumOfPage == 0) {/*写进的字节数不足一页 */
 546  0149 0d05          	tnz	(OFST-1,sp)
 547  014b 264e          	jrne	L132
 548                     ; 135       if (NumOfSingle > count){
 550  014d 7b04          	ld	a,(OFST-2,sp)
 551  014f 1106          	cp	a,(OFST+0,sp)
 552  0151 2336          	jrule	L332
 553                     ; 137         temp = NumOfSingle - count;
 555  0153 7b04          	ld	a,(OFST-2,sp)
 556  0155 1006          	sub	a,(OFST+0,sp)
 557  0157 6b03          	ld	(OFST-3,sp),a
 558                     ; 138         EEPROM_WriteOnePage(buffer, addr, count);/*把当前页的地址写完*/
 560  0159 7b06          	ld	a,(OFST+0,sp)
 561  015b 88            	push	a
 562  015c 7b0c          	ld	a,(OFST+6,sp)
 563  015e 88            	push	a
 564  015f 1e09          	ldw	x,(OFST+3,sp)
 565  0161 cd003f        	call	_EEPROM_WriteOnePage
 567  0164 85            	popw	x
 568                     ; 139         WaiteI2C_SDA_Idle();
 570  0165 cd002c        	call	_WaiteI2C_SDA_Idle
 572                     ; 140         addr +=  count;
 574  0168 7b0b          	ld	a,(OFST+5,sp)
 575  016a 1b06          	add	a,(OFST+0,sp)
 576  016c 6b0b          	ld	(OFST+5,sp),a
 577                     ; 141         buffer += count;
 579  016e 7b06          	ld	a,(OFST+0,sp)
 580  0170 5f            	clrw	x
 581  0171 97            	ld	xl,a
 582  0172 1f01          	ldw	(OFST-5,sp),x
 583  0174 1e07          	ldw	x,(OFST+1,sp)
 584  0176 72fb01        	addw	x,(OFST-5,sp)
 585  0179 1f07          	ldw	(OFST+1,sp),x
 586                     ; 142         EEPROM_WriteOnePage(buffer, addr, temp);/*在新的一页写剩余的字节*/
 588  017b 7b03          	ld	a,(OFST-3,sp)
 589  017d 88            	push	a
 590  017e 7b0c          	ld	a,(OFST+6,sp)
 591  0180 88            	push	a
 592  0181 1e09          	ldw	x,(OFST+3,sp)
 593  0183 cd003f        	call	_EEPROM_WriteOnePage
 595  0186 85            	popw	x
 597  0187 200c          	jra	L722
 598  0189               L332:
 599                     ; 146         EEPROM_WriteOnePage(buffer, addr, num);
 601  0189 7b0c          	ld	a,(OFST+6,sp)
 602  018b 88            	push	a
 603  018c 7b0c          	ld	a,(OFST+6,sp)
 604  018e 88            	push	a
 605  018f 1e09          	ldw	x,(OFST+3,sp)
 606  0191 cd003f        	call	_EEPROM_WriteOnePage
 608  0194 85            	popw	x
 609  0195               L722:
 610                     ; 174   WaiteI2C_SDA_Idle();
 612  0195 cd002c        	call	_WaiteI2C_SDA_Idle
 614                     ; 175 }
 617  0198 5b08          	addw	sp,#8
 618  019a 81            	ret
 619  019b               L132:
 620                     ; 151       num -= count;
 622  019b 7b0c          	ld	a,(OFST+6,sp)
 623  019d 1006          	sub	a,(OFST+0,sp)
 624  019f 6b0c          	ld	(OFST+6,sp),a
 625                     ; 152       NumOfPage =  num / EEPROM_Page_Byte_Size;
 627  01a1 7b0c          	ld	a,(OFST+6,sp)
 628  01a3 44            	srl	a
 629  01a4 44            	srl	a
 630  01a5 44            	srl	a
 631  01a6 6b05          	ld	(OFST-1,sp),a
 632                     ; 153       NumOfSingle = num % EEPROM_Page_Byte_Size;
 634  01a8 7b0c          	ld	a,(OFST+6,sp)
 635  01aa a407          	and	a,#7
 636  01ac 6b04          	ld	(OFST-2,sp),a
 637                     ; 155       EEPROM_WriteOnePage(buffer, addr, count);/*把当前页的地址写完*/
 639  01ae 7b06          	ld	a,(OFST+0,sp)
 640  01b0 88            	push	a
 641  01b1 7b0c          	ld	a,(OFST+6,sp)
 642  01b3 88            	push	a
 643  01b4 1e09          	ldw	x,(OFST+3,sp)
 644  01b6 cd003f        	call	_EEPROM_WriteOnePage
 646  01b9 85            	popw	x
 647                     ; 156       WaiteI2C_SDA_Idle();
 649  01ba cd002c        	call	_WaiteI2C_SDA_Idle
 651                     ; 157       addr +=  count;
 653  01bd 7b0b          	ld	a,(OFST+5,sp)
 654  01bf 1b06          	add	a,(OFST+0,sp)
 655  01c1 6b0b          	ld	(OFST+5,sp),a
 656                     ; 158       buffer += count;
 658  01c3 7b06          	ld	a,(OFST+0,sp)
 659  01c5 5f            	clrw	x
 660  01c6 97            	ld	xl,a
 661  01c7 1f01          	ldw	(OFST-5,sp),x
 662  01c9 1e07          	ldw	x,(OFST+1,sp)
 663  01cb 72fb01        	addw	x,(OFST-5,sp)
 664  01ce 1f07          	ldw	(OFST+1,sp),x
 666  01d0 201b          	jra	L342
 667  01d2               L142:
 668                     ; 162         EEPROM_WriteOnePage(buffer, addr, EEPROM_Page_Byte_Size);
 670  01d2 4b08          	push	#8
 671  01d4 7b0c          	ld	a,(OFST+6,sp)
 672  01d6 88            	push	a
 673  01d7 1e09          	ldw	x,(OFST+3,sp)
 674  01d9 cd003f        	call	_EEPROM_WriteOnePage
 676  01dc 85            	popw	x
 677                     ; 163         WaiteI2C_SDA_Idle();
 679  01dd cd002c        	call	_WaiteI2C_SDA_Idle
 681                     ; 164         addr +=  EEPROM_Page_Byte_Size;
 683  01e0 7b0b          	ld	a,(OFST+5,sp)
 684  01e2 ab08          	add	a,#8
 685  01e4 6b0b          	ld	(OFST+5,sp),a
 686                     ; 165         buffer += EEPROM_Page_Byte_Size;
 688  01e6 1e07          	ldw	x,(OFST+1,sp)
 689  01e8 1c0008        	addw	x,#8
 690  01eb 1f07          	ldw	(OFST+1,sp),x
 691  01ed               L342:
 692                     ; 160       while (NumOfPage--)
 694  01ed 7b05          	ld	a,(OFST-1,sp)
 695  01ef 0a05          	dec	(OFST-1,sp)
 696  01f1 4d            	tnz	a
 697  01f2 26de          	jrne	L142
 698                     ; 168       if (NumOfSingle != 0)
 700  01f4 0d04          	tnz	(OFST-2,sp)
 701  01f6 279d          	jreq	L722
 702                     ; 170         EEPROM_WriteOnePage(buffer, addr, NumOfSingle);
 704  01f8 7b04          	ld	a,(OFST-2,sp)
 705  01fa 88            	push	a
 706  01fb 7b0c          	ld	a,(OFST+6,sp)
 707  01fd 88            	push	a
 708  01fe 1e09          	ldw	x,(OFST+3,sp)
 709  0200 cd003f        	call	_EEPROM_WriteOnePage
 711  0203 85            	popw	x
 712  0204 208f          	jra	L722
 773                     ; 185 void EEPROM_ReadData(unsigned char *buffer,unsigned char addr,unsigned char num)
 773                     ; 186 {
 774                     	switch	.text
 775  0206               _EEPROM_ReadData:
 777  0206 89            	pushw	x
 778       00000000      OFST:	set	0
 781  0207               L103:
 782                     ; 188     while(I2C_GetFlagStatus(I2C1,I2C_FLAG_BUSY));
 784  0207 ae0302        	ldw	x,#770
 785  020a 89            	pushw	x
 786  020b ae5210        	ldw	x,#21008
 787  020e cd0000        	call	_I2C_GetFlagStatus
 789  0211 85            	popw	x
 790  0212 4d            	tnz	a
 791  0213 26f2          	jrne	L103
 792                     ; 191     I2C_GenerateSTART(I2C1,ENABLE);
 794  0215 4b01          	push	#1
 795  0217 ae5210        	ldw	x,#21008
 796  021a cd0000        	call	_I2C_GenerateSTART
 798  021d 84            	pop	a
 800  021e               L703:
 801                     ; 193     while(!I2C_CheckEvent(I2C1,I2C_EVENT_MASTER_MODE_SELECT)); 
 803  021e ae0301        	ldw	x,#769
 804  0221 89            	pushw	x
 805  0222 ae5210        	ldw	x,#21008
 806  0225 cd0000        	call	_I2C_CheckEvent
 808  0228 85            	popw	x
 809  0229 4d            	tnz	a
 810  022a 27f2          	jreq	L703
 811                     ; 196     I2C_Send7bitAddress(I2C1,EEPROM_ADDRESS, I2C_Direction_Transmitter);
 813  022c 4b00          	push	#0
 814  022e 4ba0          	push	#160
 815  0230 ae5210        	ldw	x,#21008
 816  0233 cd0000        	call	_I2C_Send7bitAddress
 818  0236 85            	popw	x
 820  0237               L513:
 821                     ; 198     while(!I2C_CheckEvent(I2C1,I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
 823  0237 ae0302        	ldw	x,#770
 824  023a 89            	pushw	x
 825  023b ae5210        	ldw	x,#21008
 826  023e cd0000        	call	_I2C_CheckEvent
 828  0241 85            	popw	x
 829  0242 4d            	tnz	a
 830  0243 27f2          	jreq	L513
 831                     ; 200     I2C_SendData(I2C1,(u8)(addr)); 
 833  0245 7b05          	ld	a,(OFST+5,sp)
 834  0247 88            	push	a
 835  0248 ae5210        	ldw	x,#21008
 836  024b cd0000        	call	_I2C_SendData
 838  024e 84            	pop	a
 840  024f               L323:
 841                     ; 202     while (!I2C_CheckEvent(I2C1,I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 843  024f ae0784        	ldw	x,#1924
 844  0252 89            	pushw	x
 845  0253 ae5210        	ldw	x,#21008
 846  0256 cd0000        	call	_I2C_CheckEvent
 848  0259 85            	popw	x
 849  025a 4d            	tnz	a
 850  025b 27f2          	jreq	L323
 851                     ; 205     I2C_GenerateSTART(I2C1,ENABLE);
 853  025d 4b01          	push	#1
 854  025f ae5210        	ldw	x,#21008
 855  0262 cd0000        	call	_I2C_GenerateSTART
 857  0265 84            	pop	a
 859  0266               L133:
 860                     ; 207     while(!I2C_CheckEvent(I2C1,I2C_EVENT_MASTER_MODE_SELECT)); 
 862  0266 ae0301        	ldw	x,#769
 863  0269 89            	pushw	x
 864  026a ae5210        	ldw	x,#21008
 865  026d cd0000        	call	_I2C_CheckEvent
 867  0270 85            	popw	x
 868  0271 4d            	tnz	a
 869  0272 27f2          	jreq	L133
 870                     ; 210     I2C_Send7bitAddress(I2C1,EEPROM_ADDRESS, I2C_Direction_Receiver);
 872  0274 4b01          	push	#1
 873  0276 4ba0          	push	#160
 874  0278 ae5210        	ldw	x,#21008
 875  027b cd0000        	call	_I2C_Send7bitAddress
 877  027e 85            	popw	x
 879  027f               L733:
 880                     ; 212     while(!I2C_CheckEvent(I2C1,I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
 882  027f ae0302        	ldw	x,#770
 883  0282 89            	pushw	x
 884  0283 ae5210        	ldw	x,#21008
 885  0286 cd0000        	call	_I2C_CheckEvent
 887  0289 85            	popw	x
 888  028a 4d            	tnz	a
 889  028b 27f2          	jreq	L733
 891  028d 2043          	jra	L543
 892  028f               L343:
 893                     ; 218     if(I2C_CheckEvent(I2C1,I2C_EVENT_MASTER_BYTE_RECEIVED)){      
 895  028f ae0340        	ldw	x,#832
 896  0292 89            	pushw	x
 897  0293 ae5210        	ldw	x,#21008
 898  0296 cd0000        	call	_I2C_CheckEvent
 900  0299 85            	popw	x
 901  029a 4d            	tnz	a
 902  029b 2735          	jreq	L543
 903                     ; 220       *buffer = I2C_ReceiveData(I2C1);
 905  029d ae5210        	ldw	x,#21008
 906  02a0 cd0000        	call	_I2C_ReceiveData
 908  02a3 1e01          	ldw	x,(OFST+1,sp)
 909  02a5 f7            	ld	(x),a
 910                     ; 222       buffer++;  
 912  02a6 1e01          	ldw	x,(OFST+1,sp)
 913  02a8 1c0001        	addw	x,#1
 914  02ab 1f01          	ldw	(OFST+1,sp),x
 915                     ; 224       if(num == 1){
 917  02ad 7b06          	ld	a,(OFST+6,sp)
 918  02af a101          	cp	a,#1
 919  02b1 2614          	jrne	L353
 920                     ; 226         I2C_AcknowledgeConfig(I2C1,DISABLE);
 922  02b3 4b00          	push	#0
 923  02b5 ae5210        	ldw	x,#21008
 924  02b8 cd0000        	call	_I2C_AcknowledgeConfig
 926  02bb 84            	pop	a
 927                     ; 228         I2C_GenerateSTOP(I2C1,ENABLE);  
 929  02bc 4b01          	push	#1
 930  02be ae5210        	ldw	x,#21008
 931  02c1 cd0000        	call	_I2C_GenerateSTOP
 933  02c4 84            	pop	a
 935  02c5 2009          	jra	L553
 936  02c7               L353:
 937                     ; 232         I2C_AcknowledgeConfig(I2C1,ENABLE);
 939  02c7 4b01          	push	#1
 940  02c9 ae5210        	ldw	x,#21008
 941  02cc cd0000        	call	_I2C_AcknowledgeConfig
 943  02cf 84            	pop	a
 944  02d0               L553:
 945                     ; 233       num--;
 947  02d0 0a06          	dec	(OFST+6,sp)
 948  02d2               L543:
 949                     ; 214   while(num)  
 951  02d2 0d06          	tnz	(OFST+6,sp)
 952  02d4 26b9          	jrne	L343
 953                     ; 236 }
 956  02d6 85            	popw	x
 957  02d7 81            	ret
 970                     	xdef	_EEPROM_WriteOnePage
 971                     	xdef	_WaiteI2C_SDA_Idle
 972                     	xdef	_EEPROM_ReadData
 973                     	xdef	_EEPROM_WriteData
 974                     	xdef	_InitIIC
 975                     	xref	_I2C_GetFlagStatus
 976                     	xref	_I2C_CheckEvent
 977                     	xref	_I2C_ReceiveData
 978                     	xref	_I2C_SendData
 979                     	xref	_I2C_Send7bitAddress
 980                     	xref	_I2C_AcknowledgeConfig
 981                     	xref	_I2C_GenerateSTOP
 982                     	xref	_I2C_GenerateSTART
 983                     	xref	_I2C_Cmd
 984                     	xref	_I2C_Init
 985                     	xref	_I2C_DeInit
1004                     	end
