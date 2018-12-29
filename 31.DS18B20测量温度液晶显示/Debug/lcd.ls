   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     .const:	section	.text
   5  0000               _NumberMap:
   6  0000 3132          	dc.w	12594
   7  0002 2020          	dc.w	8224
   8  0004 3212          	dc.w	12818
   9  0006 3222          	dc.w	12834
  10  0008 2320          	dc.w	8992
  11  000a 1322          	dc.w	4898
  12  000c 1332          	dc.w	4914
  13  000e 3020          	dc.w	12320
  14  0010 3332          	dc.w	13106
  15  0012 3322          	dc.w	13090
  53                     ; 18 void InitLCD(void)
  53                     ; 19 {
  55                     	switch	.text
  56  0000               _InitLCD:
  60                     ; 20     CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);//LCD驱动时钟门控使能
  62  0000 ae0001        	ldw	x,#1
  63  0003 a613          	ld	a,#19
  64  0005 95            	ld	xh,a
  65  0006 cd0000        	call	_CLK_PeripheralClockConfig
  67                     ; 21     CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);//配置RTC LSI或LSE
  69  0009 5f            	clrw	x
  70  000a a604          	ld	a,#4
  71  000c 95            	ld	xh,a
  72  000d cd0000        	call	_CLK_RTCClockConfig
  74                     ; 22     LCD_DeInit( );//LCD相关寄存器恢复初值
  76  0010 cd0000        	call	_LCD_DeInit
  78                     ; 23     LCD_Init(LCD_Prescaler_4, LCD_Divider_16,//LCD驱动初始化，LCD刷新频率
  78                     ; 24               LCD_Duty_1_4, LCD_Bias_1_3,//1/4DUTY 1/3BIAS，看屏幕参数
  78                     ; 25               LCD_VoltageSource_External);//选择LCD驱动电源，外部或内部
  80  0013 4b01          	push	#1
  81  0015 4b00          	push	#0
  82  0017 4b06          	push	#6
  83  0019 5f            	clrw	x
  84  001a a620          	ld	a,#32
  85  001c 95            	ld	xh,a
  86  001d cd0000        	call	_LCD_Init
  88  0020 5b03          	addw	sp,#3
  89                     ; 27     LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0x00); //SEG0-7，STM8L152K4T6没有
  91  0022 5f            	clrw	x
  92  0023 4f            	clr	a
  93  0024 95            	ld	xh,a
  94  0025 cd0000        	call	_LCD_PortMaskConfig
  96                     ; 28     LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFF); //SEG8-SEG15，STM8L参考手册228页
  98  0028 ae00ff        	ldw	x,#255
  99  002b a601          	ld	a,#1
 100  002d 95            	ld	xh,a
 101  002e cd0000        	call	_LCD_PortMaskConfig
 103                     ; 29     LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0x00); //以下SEG均没选用
 105  0031 5f            	clrw	x
 106  0032 a602          	ld	a,#2
 107  0034 95            	ld	xh,a
 108  0035 cd0000        	call	_LCD_PortMaskConfig
 110                     ; 30     LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0x00);
 112  0038 5f            	clrw	x
 113  0039 a603          	ld	a,#3
 114  003b 95            	ld	xh,a
 115  003c cd0000        	call	_LCD_PortMaskConfig
 117                     ; 31     LCD_PortMaskConfig(LCD_PortMaskRegister_4, 0x00); 
 119  003f 5f            	clrw	x
 120  0040 a604          	ld	a,#4
 121  0042 95            	ld	xh,a
 122  0043 cd0000        	call	_LCD_PortMaskConfig
 124                     ; 32     LCD_PortMaskConfig(LCD_PortMaskRegister_5, 0x00);
 126  0046 5f            	clrw	x
 127  0047 a605          	ld	a,#5
 128  0049 95            	ld	xh,a
 129  004a cd0000        	call	_LCD_PortMaskConfig
 131                     ; 33     LCD_ContrastConfig(LCD_Contrast_3V3);//配置对比度
 133  004d a60e          	ld	a,#14
 134  004f cd0000        	call	_LCD_ContrastConfig
 136                     ; 34     LCD_DeadTimeConfig(LCD_DeadTime_0); //设置死区时间
 138  0052 4f            	clr	a
 139  0053 cd0000        	call	_LCD_DeadTimeConfig
 141                     ; 35     LCD_PulseOnDurationConfig(LCD_PulseOnDuration_5);// 配置LCD脉冲持续时间
 143  0056 a6a0          	ld	a,#160
 144  0058 cd0000        	call	_LCD_PulseOnDurationConfig
 146                     ; 37     LCD_Cmd(ENABLE);
 148  005b a601          	ld	a,#1
 149  005d cd0000        	call	_LCD_Cmd
 151                     ; 38 }
 154  0060 81            	ret
 193                     ; 49 void data_convertor(unsigned long adc_value) 
 193                     ; 50 {  
 194                     	switch	.text
 195  0061               _data_convertor:
 197       00000000      OFST:	set	0
 200                     ; 51     tmp=adc_value;         //adc 
 202  0061 1e05          	ldw	x,(OFST+5,sp)
 203  0063 bf08          	ldw	_tmp,x
 204                     ; 52     n4=tmp/1000;
 206  0065 be08          	ldw	x,_tmp
 207  0067 90ae03e8      	ldw	y,#1000
 208  006b 65            	divw	x,y
 209  006c bf00          	ldw	_n4,x
 210                     ; 53     tmp=tmp%1000;
 212  006e be08          	ldw	x,_tmp
 213  0070 90ae03e8      	ldw	y,#1000
 214  0074 65            	divw	x,y
 215  0075 51            	exgw	x,y
 216  0076 bf08          	ldw	_tmp,x
 217                     ; 54     n3=tmp/100;
 219  0078 be08          	ldw	x,_tmp
 220  007a a664          	ld	a,#100
 221  007c 62            	div	x,a
 222  007d bf02          	ldw	_n3,x
 223                     ; 55     tmp=tmp%100;	
 225  007f be08          	ldw	x,_tmp
 226  0081 a664          	ld	a,#100
 227  0083 62            	div	x,a
 228  0084 5f            	clrw	x
 229  0085 97            	ld	xl,a
 230  0086 bf08          	ldw	_tmp,x
 231                     ; 56     n2=tmp/10;
 233  0088 be08          	ldw	x,_tmp
 234  008a a60a          	ld	a,#10
 235  008c 62            	div	x,a
 236  008d bf04          	ldw	_n2,x
 237                     ; 57     tmp=tmp%10;		
 239  008f be08          	ldw	x,_tmp
 240  0091 a60a          	ld	a,#10
 241  0093 62            	div	x,a
 242  0094 5f            	clrw	x
 243  0095 97            	ld	xl,a
 244  0096 bf08          	ldw	_tmp,x
 245                     ; 58     n1=tmp; 
 247  0098 be08          	ldw	x,_tmp
 248  009a bf06          	ldw	_n1,x
 249                     ; 59  }
 252  009c 81            	ret
 282                     ; 60 void Display(void)
 282                     ; 61 {    //对显示缓冲区操作，要结合液晶说明书 
 283                     	switch	.text
 284  009d               _Display:
 286  009d 5206          	subw	sp,#6
 287       00000006      OFST:	set	6
 290                     ; 62       LCD_DisBuffer[0]=(((NumberMap[n4] &0xf000)>>12)<<0)|(((NumberMap[n3] &0xf000)>>12)<<2)|(((NumberMap[n2] &0xf000)>>12)<<4)|(((NumberMap[n1] &0xf000)>>12)<<6);//COM0,SEG15-SEG8
 292  009f be06          	ldw	x,_n1
 293  00a1 58            	sllw	x
 294  00a2 de0000        	ldw	x,(_NumberMap,x)
 295  00a5 01            	rrwa	x,a
 296  00a6 9f            	ld	a,xl
 297  00a7 a4f0          	and	a,#240
 298  00a9 97            	ld	xl,a
 299  00aa 4f            	clr	a
 300  00ab 02            	rlwa	x,a
 301  00ac 01            	rrwa	x,a
 302  00ad 4f            	clr	a
 303  00ae 41            	exg	a,xl
 304  00af 4e            	swap	a
 305  00b0 a40f          	and	a,#15
 306  00b2 02            	rlwa	x,a
 307  00b3 58            	sllw	x
 308  00b4 58            	sllw	x
 309  00b5 58            	sllw	x
 310  00b6 58            	sllw	x
 311  00b7 58            	sllw	x
 312  00b8 58            	sllw	x
 313  00b9 1f05          	ldw	(OFST-1,sp),x
 314  00bb be04          	ldw	x,_n2
 315  00bd 58            	sllw	x
 316  00be de0000        	ldw	x,(_NumberMap,x)
 317  00c1 01            	rrwa	x,a
 318  00c2 9f            	ld	a,xl
 319  00c3 a4f0          	and	a,#240
 320  00c5 97            	ld	xl,a
 321  00c6 4f            	clr	a
 322  00c7 02            	rlwa	x,a
 323  00c8 01            	rrwa	x,a
 324  00c9 4f            	clr	a
 325  00ca 41            	exg	a,xl
 326  00cb 4e            	swap	a
 327  00cc a40f          	and	a,#15
 328  00ce 02            	rlwa	x,a
 329  00cf 58            	sllw	x
 330  00d0 58            	sllw	x
 331  00d1 58            	sllw	x
 332  00d2 58            	sllw	x
 333  00d3 1f03          	ldw	(OFST-3,sp),x
 334  00d5 be02          	ldw	x,_n3
 335  00d7 58            	sllw	x
 336  00d8 de0000        	ldw	x,(_NumberMap,x)
 337  00db 01            	rrwa	x,a
 338  00dc 9f            	ld	a,xl
 339  00dd a4f0          	and	a,#240
 340  00df 97            	ld	xl,a
 341  00e0 4f            	clr	a
 342  00e1 02            	rlwa	x,a
 343  00e2 01            	rrwa	x,a
 344  00e3 4f            	clr	a
 345  00e4 41            	exg	a,xl
 346  00e5 4e            	swap	a
 347  00e6 a40f          	and	a,#15
 348  00e8 02            	rlwa	x,a
 349  00e9 58            	sllw	x
 350  00ea 58            	sllw	x
 351  00eb 1f01          	ldw	(OFST-5,sp),x
 352  00ed be00          	ldw	x,_n4
 353  00ef 58            	sllw	x
 354  00f0 de0000        	ldw	x,(_NumberMap,x)
 355  00f3 01            	rrwa	x,a
 356  00f4 9f            	ld	a,xl
 357  00f5 a4f0          	and	a,#240
 358  00f7 97            	ld	xl,a
 359  00f8 4f            	clr	a
 360  00f9 02            	rlwa	x,a
 361  00fa 01            	rrwa	x,a
 362  00fb 4f            	clr	a
 363  00fc 41            	exg	a,xl
 364  00fd 4e            	swap	a
 365  00fe a40f          	and	a,#15
 366  0100 02            	rlwa	x,a
 367  0101 01            	rrwa	x,a
 368  0102 1a02          	or	a,(OFST-4,sp)
 369  0104 01            	rrwa	x,a
 370  0105 1a01          	or	a,(OFST-5,sp)
 371  0107 01            	rrwa	x,a
 372  0108 01            	rrwa	x,a
 373  0109 1a04          	or	a,(OFST-2,sp)
 374  010b 01            	rrwa	x,a
 375  010c 1a03          	or	a,(OFST-3,sp)
 376  010e 01            	rrwa	x,a
 377  010f 01            	rrwa	x,a
 378  0110 1a06          	or	a,(OFST+0,sp)
 379  0112 01            	rrwa	x,a
 380  0113 1a05          	or	a,(OFST-1,sp)
 381  0115 01            	rrwa	x,a
 382  0116 01            	rrwa	x,a
 383  0117 b70a          	ld	_LCD_DisBuffer,a
 384  0119 02            	rlwa	x,a
 385                     ; 63       LCD_DisBuffer[1]=(((NumberMap[n4] &0x0f00)>>8)<<0)|(((NumberMap[n3] &0x0f00)>>8)<<2)|(((NumberMap[n2] &0x0f00)>>8)<<4)|(((NumberMap[n1] &0x0f00)>>8)<<6);    //COM1
 387  011a be06          	ldw	x,_n1
 388  011c 58            	sllw	x
 389  011d de0000        	ldw	x,(_NumberMap,x)
 390  0120 01            	rrwa	x,a
 391  0121 9f            	ld	a,xl
 392  0122 a40f          	and	a,#15
 393  0124 97            	ld	xl,a
 394  0125 4f            	clr	a
 395  0126 02            	rlwa	x,a
 396  0127 4f            	clr	a
 397  0128 01            	rrwa	x,a
 398  0129 58            	sllw	x
 399  012a 58            	sllw	x
 400  012b 58            	sllw	x
 401  012c 58            	sllw	x
 402  012d 58            	sllw	x
 403  012e 58            	sllw	x
 404  012f 1f05          	ldw	(OFST-1,sp),x
 405  0131 be04          	ldw	x,_n2
 406  0133 58            	sllw	x
 407  0134 de0000        	ldw	x,(_NumberMap,x)
 408  0137 01            	rrwa	x,a
 409  0138 9f            	ld	a,xl
 410  0139 a40f          	and	a,#15
 411  013b 97            	ld	xl,a
 412  013c 4f            	clr	a
 413  013d 02            	rlwa	x,a
 414  013e 4f            	clr	a
 415  013f 01            	rrwa	x,a
 416  0140 58            	sllw	x
 417  0141 58            	sllw	x
 418  0142 58            	sllw	x
 419  0143 58            	sllw	x
 420  0144 1f03          	ldw	(OFST-3,sp),x
 421  0146 be02          	ldw	x,_n3
 422  0148 58            	sllw	x
 423  0149 de0000        	ldw	x,(_NumberMap,x)
 424  014c 01            	rrwa	x,a
 425  014d 9f            	ld	a,xl
 426  014e a40f          	and	a,#15
 427  0150 97            	ld	xl,a
 428  0151 4f            	clr	a
 429  0152 02            	rlwa	x,a
 430  0153 4f            	clr	a
 431  0154 01            	rrwa	x,a
 432  0155 58            	sllw	x
 433  0156 58            	sllw	x
 434  0157 1f01          	ldw	(OFST-5,sp),x
 435  0159 be00          	ldw	x,_n4
 436  015b 58            	sllw	x
 437  015c de0000        	ldw	x,(_NumberMap,x)
 438  015f 01            	rrwa	x,a
 439  0160 9f            	ld	a,xl
 440  0161 a40f          	and	a,#15
 441  0163 97            	ld	xl,a
 442  0164 4f            	clr	a
 443  0165 02            	rlwa	x,a
 444  0166 4f            	clr	a
 445  0167 01            	rrwa	x,a
 446  0168 01            	rrwa	x,a
 447  0169 1a02          	or	a,(OFST-4,sp)
 448  016b 01            	rrwa	x,a
 449  016c 1a01          	or	a,(OFST-5,sp)
 450  016e 01            	rrwa	x,a
 451  016f 01            	rrwa	x,a
 452  0170 1a04          	or	a,(OFST-2,sp)
 453  0172 01            	rrwa	x,a
 454  0173 1a03          	or	a,(OFST-3,sp)
 455  0175 01            	rrwa	x,a
 456  0176 01            	rrwa	x,a
 457  0177 1a06          	or	a,(OFST+0,sp)
 458  0179 01            	rrwa	x,a
 459  017a 1a05          	or	a,(OFST-1,sp)
 460  017c 01            	rrwa	x,a
 461  017d 01            	rrwa	x,a
 462  017e b70b          	ld	_LCD_DisBuffer+1,a
 463  0180 02            	rlwa	x,a
 464                     ; 64       LCD_DisBuffer[2]=(((NumberMap[n4] &0x00f0)>>4)<<0)|(((NumberMap[n3] &0x00f0)>>4)<<2)|(((NumberMap[n2] &0x00f0)>>4)<<4)|(((NumberMap[n1] &0x00f0)>>4)<<6);    //COM2
 466  0181 be06          	ldw	x,_n1
 467  0183 58            	sllw	x
 468  0184 d60001        	ld	a,(_NumberMap+1,x)
 469  0187 a4f0          	and	a,#240
 470  0189 4e            	swap	a
 471  018a a40f          	and	a,#15
 472  018c 97            	ld	xl,a
 473  018d a640          	ld	a,#64
 474  018f 42            	mul	x,a
 475  0190 9f            	ld	a,xl
 476  0191 6b06          	ld	(OFST+0,sp),a
 477  0193 be04          	ldw	x,_n2
 478  0195 58            	sllw	x
 479  0196 d60001        	ld	a,(_NumberMap+1,x)
 480  0199 a4f0          	and	a,#240
 481  019b 4e            	swap	a
 482  019c a40f          	and	a,#15
 483  019e 97            	ld	xl,a
 484  019f a610          	ld	a,#16
 485  01a1 42            	mul	x,a
 486  01a2 9f            	ld	a,xl
 487  01a3 6b05          	ld	(OFST-1,sp),a
 488  01a5 be02          	ldw	x,_n3
 489  01a7 58            	sllw	x
 490  01a8 d60001        	ld	a,(_NumberMap+1,x)
 491  01ab a4f0          	and	a,#240
 492  01ad 4e            	swap	a
 493  01ae a40f          	and	a,#15
 494  01b0 48            	sll	a
 495  01b1 48            	sll	a
 496  01b2 6b04          	ld	(OFST-2,sp),a
 497  01b4 be00          	ldw	x,_n4
 498  01b6 58            	sllw	x
 499  01b7 d60001        	ld	a,(_NumberMap+1,x)
 500  01ba a4f0          	and	a,#240
 501  01bc 4e            	swap	a
 502  01bd a40f          	and	a,#15
 503  01bf 1a04          	or	a,(OFST-2,sp)
 504  01c1 1a05          	or	a,(OFST-1,sp)
 505  01c3 1a06          	or	a,(OFST+0,sp)
 506  01c5 b70c          	ld	_LCD_DisBuffer+2,a
 507                     ; 65       LCD_DisBuffer[3]=(((NumberMap[n4] &0x000f)>>0)<<0)|(((NumberMap[n3] &0x000f)>>0)<<2)|(((NumberMap[n2] &0x000f)>>0)<<4)|(((NumberMap[n1] &0x000f)>>0)<<6);    //COM3
 509  01c7 be06          	ldw	x,_n1
 510  01c9 58            	sllw	x
 511  01ca d60001        	ld	a,(_NumberMap+1,x)
 512  01cd a40f          	and	a,#15
 513  01cf 97            	ld	xl,a
 514  01d0 a640          	ld	a,#64
 515  01d2 42            	mul	x,a
 516  01d3 9f            	ld	a,xl
 517  01d4 6b06          	ld	(OFST+0,sp),a
 518  01d6 be04          	ldw	x,_n2
 519  01d8 58            	sllw	x
 520  01d9 d60001        	ld	a,(_NumberMap+1,x)
 521  01dc a40f          	and	a,#15
 522  01de 97            	ld	xl,a
 523  01df a610          	ld	a,#16
 524  01e1 42            	mul	x,a
 525  01e2 9f            	ld	a,xl
 526  01e3 6b05          	ld	(OFST-1,sp),a
 527  01e5 be02          	ldw	x,_n3
 528  01e7 58            	sllw	x
 529  01e8 d60001        	ld	a,(_NumberMap+1,x)
 530  01eb a40f          	and	a,#15
 531  01ed 48            	sll	a
 532  01ee 48            	sll	a
 533  01ef 6b04          	ld	(OFST-2,sp),a
 534  01f1 be00          	ldw	x,_n4
 535  01f3 58            	sllw	x
 536  01f4 d60001        	ld	a,(_NumberMap+1,x)
 537  01f7 a40f          	and	a,#15
 538  01f9 1a04          	or	a,(OFST-2,sp)
 539  01fb 1a05          	or	a,(OFST-1,sp)
 540  01fd 1a06          	or	a,(OFST+0,sp)
 541  01ff b70d          	ld	_LCD_DisBuffer+3,a
 542                     ; 68       LCD_WriteRAM(LCD_RAMRegister_1,LCD_DisBuffer[0]);  //SEG8-SEG15对应寄存器RAM1，COM0
 544  0201 b60a          	ld	a,_LCD_DisBuffer
 545  0203 97            	ld	xl,a
 546  0204 a601          	ld	a,#1
 547  0206 95            	ld	xh,a
 548  0207 cd0000        	call	_LCD_WriteRAM
 550                     ; 70       LCD_WriteRAM(LCD_RAMRegister_4,LCD_DisBuffer[1]<<4);//COM1，SEG8-SEG11对应RAM4高四位
 552  020a b60b          	ld	a,_LCD_DisBuffer+1
 553  020c 97            	ld	xl,a
 554  020d a610          	ld	a,#16
 555  020f 42            	mul	x,a
 556  0210 9f            	ld	a,xl
 557  0211 97            	ld	xl,a
 558  0212 a604          	ld	a,#4
 559  0214 95            	ld	xh,a
 560  0215 cd0000        	call	_LCD_WriteRAM
 562                     ; 71       LCD_WriteRAM(LCD_RAMRegister_5,LCD_DisBuffer[1]>>4);//COM1，SEG12-SEG15对应RAM5低四位
 564  0218 b60b          	ld	a,_LCD_DisBuffer+1
 565  021a 4e            	swap	a
 566  021b a40f          	and	a,#15
 567  021d 97            	ld	xl,a
 568  021e a605          	ld	a,#5
 569  0220 95            	ld	xh,a
 570  0221 cd0000        	call	_LCD_WriteRAM
 572                     ; 73       LCD_WriteRAM(LCD_RAMRegister_8,LCD_DisBuffer[2]); //COM2，SEG8-SEG15对应RAM8
 574  0224 b60c          	ld	a,_LCD_DisBuffer+2
 575  0226 97            	ld	xl,a
 576  0227 a608          	ld	a,#8
 577  0229 95            	ld	xh,a
 578  022a cd0000        	call	_LCD_WriteRAM
 580                     ; 75       LCD_WriteRAM(LCD_RAMRegister_11,LCD_DisBuffer[3]<<4);//COM3，SEG8-SEG11对应RAM11高四位
 582  022d b60d          	ld	a,_LCD_DisBuffer+3
 583  022f 97            	ld	xl,a
 584  0230 a610          	ld	a,#16
 585  0232 42            	mul	x,a
 586  0233 9f            	ld	a,xl
 587  0234 97            	ld	xl,a
 588  0235 a60b          	ld	a,#11
 589  0237 95            	ld	xh,a
 590  0238 cd0000        	call	_LCD_WriteRAM
 592                     ; 76       LCD_WriteRAM(LCD_RAMRegister_12,LCD_DisBuffer[3]>>4);//COM3，SEG12-SEG15对应RAM12低四位
 594  023b b60d          	ld	a,_LCD_DisBuffer+3
 595  023d 4e            	swap	a
 596  023e a40f          	and	a,#15
 597  0240 97            	ld	xl,a
 598  0241 a60c          	ld	a,#12
 599  0243 95            	ld	xh,a
 600  0244 cd0000        	call	_LCD_WriteRAM
 602                     ; 79 }
 605  0247 5b06          	addw	sp,#6
 606  0249 81            	ret
 631                     ; 80 void Display_lcd_dot(void) 
 631                     ; 81 { 
 632                     	switch	.text
 633  024a               _Display_lcd_dot:
 637                     ; 84     LCD_WriteRAM(LCD_RAMRegister_12,LCD_DisBuffer[3]>>4|0x01);//3P
 639  024a b60d          	ld	a,_LCD_DisBuffer+3
 640  024c 4e            	swap	a
 641  024d a40f          	and	a,#15
 642  024f aa01          	or	a,#1
 643  0251 97            	ld	xl,a
 644  0252 a60c          	ld	a,#12
 645  0254 95            	ld	xh,a
 646  0255 cd0000        	call	_LCD_WriteRAM
 648                     ; 85 }
 651  0258 81            	ret
 731                     	switch	.ubsct
 732  0000               _n4:
 733  0000 0000          	ds.b	2
 734                     	xdef	_n4
 735  0002               _n3:
 736  0002 0000          	ds.b	2
 737                     	xdef	_n3
 738  0004               _n2:
 739  0004 0000          	ds.b	2
 740                     	xdef	_n2
 741  0006               _n1:
 742  0006 0000          	ds.b	2
 743                     	xdef	_n1
 744  0008               _tmp:
 745  0008 0000          	ds.b	2
 746                     	xdef	_tmp
 747                     	xdef	_NumberMap
 748  000a               _LCD_DisBuffer:
 749  000a 00000000      	ds.b	4
 750                     	xdef	_LCD_DisBuffer
 751                     	xdef	_Display_lcd_dot
 752                     	xdef	_Display
 753                     	xdef	_data_convertor
 754                     	xdef	_InitLCD
 755                     	xref	_LCD_WriteRAM
 756                     	xref	_LCD_ContrastConfig
 757                     	xref	_LCD_DeadTimeConfig
 758                     	xref	_LCD_PulseOnDurationConfig
 759                     	xref	_LCD_Cmd
 760                     	xref	_LCD_PortMaskConfig
 761                     	xref	_LCD_Init
 762                     	xref	_LCD_DeInit
 763                     	xref	_CLK_PeripheralClockConfig
 764                     	xref	_CLK_RTCClockConfig
 784                     	end
