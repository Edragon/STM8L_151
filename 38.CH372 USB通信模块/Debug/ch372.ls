   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  53                     ; 7 void Delay(unsigned int nCount)
  53                     ; 8 {
  55                     	switch	.text
  56  0000               _Delay:
  58  0000 89            	pushw	x
  59       00000000      OFST:	set	0
  62  0001 2007          	jra	L13
  63  0003               L72:
  64                     ; 11     nCount--;
  66  0003 1e01          	ldw	x,(OFST+1,sp)
  67  0005 1d0001        	subw	x,#1
  68  0008 1f01          	ldw	(OFST+1,sp),x
  69  000a               L13:
  70                     ; 9    while (nCount != 0)
  72  000a 1e01          	ldw	x,(OFST+1,sp)
  73  000c 26f5          	jrne	L72
  74                     ; 13 }
  77  000e 85            	popw	x
  78  000f 81            	ret
 106                     ; 17 void CH372_Init(void)
 106                     ; 18 {
 107                     	switch	.text
 108  0010               _CH372_Init:
 112                     ; 20    GPIO_Init(CH372_CS_PORT, CH372_CS_PIN, GPIO_Mode_Out_PP_High_Slow);//CS
 114  0010 4bd0          	push	#208
 115  0012 4b01          	push	#1
 116  0014 ae5005        	ldw	x,#20485
 117  0017 cd0000        	call	_GPIO_Init
 119  001a 85            	popw	x
 120                     ; 21    GPIO_Init(CH372_AO_PORT, CH372_AO_PIN, GPIO_Mode_Out_PP_High_Slow);//AO
 122  001b 4bd0          	push	#208
 123  001d 4b02          	push	#2
 124  001f ae5005        	ldw	x,#20485
 125  0022 cd0000        	call	_GPIO_Init
 127  0025 85            	popw	x
 128                     ; 22    GPIO_Init(CH372_WR_PORT, CH372_WR_PIN, GPIO_Mode_Out_PP_High_Slow);//WR
 130  0026 4bd0          	push	#208
 131  0028 4b04          	push	#4
 132  002a ae5005        	ldw	x,#20485
 133  002d cd0000        	call	_GPIO_Init
 135  0030 85            	popw	x
 136                     ; 23    GPIO_Init(CH372_RD_PORT, CH372_RD_PIN, GPIO_Mode_Out_PP_High_Slow);//RD
 138  0031 4bd0          	push	#208
 139  0033 4b08          	push	#8
 140  0035 ae5005        	ldw	x,#20485
 141  0038 cd0000        	call	_GPIO_Init
 143  003b 85            	popw	x
 144                     ; 25    GPIO_ExternalPullUpConfig(CH372_CS_PORT, CH372_CS_PIN, ENABLE);
 146  003c 4b01          	push	#1
 147  003e 4b01          	push	#1
 148  0040 ae5005        	ldw	x,#20485
 149  0043 cd0000        	call	_GPIO_ExternalPullUpConfig
 151  0046 85            	popw	x
 152                     ; 26    GPIO_ExternalPullUpConfig(CH372_AO_PORT, CH372_AO_PIN, ENABLE);
 154  0047 4b01          	push	#1
 155  0049 4b02          	push	#2
 156  004b ae5005        	ldw	x,#20485
 157  004e cd0000        	call	_GPIO_ExternalPullUpConfig
 159  0051 85            	popw	x
 160                     ; 27    GPIO_ExternalPullUpConfig(CH372_WR_PORT, CH372_WR_PIN, ENABLE);
 162  0052 4b01          	push	#1
 163  0054 4b04          	push	#4
 164  0056 ae5005        	ldw	x,#20485
 165  0059 cd0000        	call	_GPIO_ExternalPullUpConfig
 167  005c 85            	popw	x
 168                     ; 28    GPIO_ExternalPullUpConfig(CH372_RD_PORT, CH372_RD_PIN, ENABLE);
 170  005d 4b01          	push	#1
 171  005f 4b08          	push	#8
 172  0061 ae5005        	ldw	x,#20485
 173  0064 cd0000        	call	_GPIO_ExternalPullUpConfig
 175  0067 85            	popw	x
 176                     ; 29    GPIO_Init(CH372_DATA_PORT, GPIO_Pin_All, GPIO_Mode_Out_PP_High_Slow);
 178  0068 4bd0          	push	#208
 179  006a 4bff          	push	#255
 180  006c ae500f        	ldw	x,#20495
 181  006f cd0000        	call	_GPIO_Init
 183  0072 85            	popw	x
 184                     ; 37     EXTI_DeInit (); //恢复中断的所有设置 
 186  0073 cd0000        	call	_EXTI_DeInit
 188                     ; 38     EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//外部中断4，下降沿触发
 190  0076 ae1002        	ldw	x,#4098
 191  0079 cd0000        	call	_EXTI_SetPinSensitivity
 193                     ; 39     enableInterrupts();//使能中断
 196  007c 9a            rim
 198                     ; 42 }
 202  007d 81            	ret
 242                     ; 47 void CH372_WR_CMD(s8 Cmd)
 242                     ; 48 {
 243                     	switch	.text
 244  007e               _CH372_WR_CMD:
 246  007e 88            	push	a
 247       00000000      OFST:	set	0
 250                     ; 52    GPIO_Init(CH372_DATA_PORT, GPIO_Pin_All, GPIO_Mode_Out_PP_High_Slow);
 252  007f 4bd0          	push	#208
 253  0081 4bff          	push	#255
 254  0083 ae500f        	ldw	x,#20495
 255  0086 cd0000        	call	_GPIO_Init
 257  0089 85            	popw	x
 258                     ; 53    GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_All, ENABLE);
 260  008a 4b01          	push	#1
 261  008c 4bff          	push	#255
 262  008e ae5005        	ldw	x,#20485
 263  0091 cd0000        	call	_GPIO_ExternalPullUpConfig
 265  0094 85            	popw	x
 266                     ; 55    GPIO_Write(CH372_DATA_PORT, Cmd);
 268  0095 7b01          	ld	a,(OFST+1,sp)
 269  0097 88            	push	a
 270  0098 ae500f        	ldw	x,#20495
 271  009b cd0000        	call	_GPIO_Write
 273  009e 84            	pop	a
 274                     ; 57    GPIO_SetBits(CH372_AO_PORT, CH372_AO_PIN);//高电平写命令
 276  009f 4b02          	push	#2
 277  00a1 ae5005        	ldw	x,#20485
 278  00a4 cd0000        	call	_GPIO_SetBits
 280  00a7 84            	pop	a
 281                     ; 60    GPIO_SetBits(CH372_RD_PORT, CH372_RD_PIN);
 283  00a8 4b08          	push	#8
 284  00aa ae5005        	ldw	x,#20485
 285  00ad cd0000        	call	_GPIO_SetBits
 287  00b0 84            	pop	a
 288                     ; 62    GPIO_ResetBits(CH372_CS_PORT, CH372_CS_PIN);
 290  00b1 4b01          	push	#1
 291  00b3 ae5005        	ldw	x,#20485
 292  00b6 cd0000        	call	_GPIO_ResetBits
 294  00b9 84            	pop	a
 295                     ; 64    GPIO_ResetBits(CH372_WR_PORT, CH372_WR_PIN);
 297  00ba 4b04          	push	#4
 298  00bc ae5005        	ldw	x,#20485
 299  00bf cd0000        	call	_GPIO_ResetBits
 301  00c2 84            	pop	a
 302                     ; 68    GPIO_SetBits(CH372_WR_PORT, CH372_WR_PIN);
 304  00c3 4b04          	push	#4
 305  00c5 ae5005        	ldw	x,#20485
 306  00c8 cd0000        	call	_GPIO_SetBits
 308  00cb 84            	pop	a
 309                     ; 69    GPIO_SetBits(CH372_CS_PORT, CH372_CS_PIN);
 311  00cc 4b01          	push	#1
 312  00ce ae5005        	ldw	x,#20485
 313  00d1 cd0000        	call	_GPIO_SetBits
 315  00d4 84            	pop	a
 316                     ; 70    GPIO_ResetBits(CH372_AO_PORT, CH372_AO_PIN);
 318  00d5 4b02          	push	#2
 319  00d7 ae5005        	ldw	x,#20485
 320  00da cd0000        	call	_GPIO_ResetBits
 322  00dd 84            	pop	a
 323                     ; 73      Delay(1);
 325  00de ae0001        	ldw	x,#1
 326  00e1 cd0000        	call	_Delay
 328                     ; 76 }
 331  00e4 84            	pop	a
 332  00e5 81            	ret
 372                     ; 78 void CH372_WR_DAT(s8 Dat)
 372                     ; 79 {
 373                     	switch	.text
 374  00e6               _CH372_WR_DAT:
 376  00e6 88            	push	a
 377       00000000      OFST:	set	0
 380                     ; 81    GPIO_Init(CH372_DATA_PORT, GPIO_Pin_All, GPIO_Mode_Out_PP_High_Slow);
 382  00e7 4bd0          	push	#208
 383  00e9 4bff          	push	#255
 384  00eb ae500f        	ldw	x,#20495
 385  00ee cd0000        	call	_GPIO_Init
 387  00f1 85            	popw	x
 388                     ; 82    GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_All, ENABLE);
 390  00f2 4b01          	push	#1
 391  00f4 4bff          	push	#255
 392  00f6 ae5005        	ldw	x,#20485
 393  00f9 cd0000        	call	_GPIO_ExternalPullUpConfig
 395  00fc 85            	popw	x
 396                     ; 83    GPIO_Write(CH372_DATA_PORT, Dat);
 398  00fd 7b01          	ld	a,(OFST+1,sp)
 399  00ff 88            	push	a
 400  0100 ae500f        	ldw	x,#20495
 401  0103 cd0000        	call	_GPIO_Write
 403  0106 84            	pop	a
 404                     ; 85    GPIO_ResetBits(CH372_AO_PORT, CH372_AO_PIN);
 406  0107 4b02          	push	#2
 407  0109 ae5005        	ldw	x,#20485
 408  010c cd0000        	call	_GPIO_ResetBits
 410  010f 84            	pop	a
 411                     ; 87    GPIO_ResetBits(CH372_CS_PORT, CH372_CS_PIN);
 413  0110 4b01          	push	#1
 414  0112 ae5005        	ldw	x,#20485
 415  0115 cd0000        	call	_GPIO_ResetBits
 417  0118 84            	pop	a
 418                     ; 89    GPIO_ResetBits(CH372_WR_PORT, CH372_WR_PIN);
 420  0119 4b04          	push	#4
 421  011b ae5005        	ldw	x,#20485
 422  011e cd0000        	call	_GPIO_ResetBits
 424  0121 84            	pop	a
 425                     ; 91    GPIO_ResetBits(CH372_CS_PORT, CH372_CS_PIN);
 427  0122 4b01          	push	#1
 428  0124 ae5005        	ldw	x,#20485
 429  0127 cd0000        	call	_GPIO_ResetBits
 431  012a 84            	pop	a
 432                     ; 93    GPIO_SetBits(CH372_WR_PORT, CH372_WR_PIN);
 434  012b 4b04          	push	#4
 435  012d ae5005        	ldw	x,#20485
 436  0130 cd0000        	call	_GPIO_SetBits
 438  0133 84            	pop	a
 439                     ; 94    GPIO_SetBits(CH372_CS_PORT, CH372_CS_PIN);
 441  0134 4b01          	push	#1
 442  0136 ae5005        	ldw	x,#20485
 443  0139 cd0000        	call	_GPIO_SetBits
 445  013c 84            	pop	a
 446                     ; 96 GPIO_Init(GPIOA, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Slow);
 448  013d 4bc0          	push	#192
 449  013f 4b40          	push	#64
 450  0141 ae5000        	ldw	x,#20480
 451  0144 cd0000        	call	_GPIO_Init
 453  0147 85            	popw	x
 454                     ; 98    Delay(10); 
 456  0148 ae000a        	ldw	x,#10
 457  014b cd0000        	call	_Delay
 459                     ; 99 }
 462  014e 84            	pop	a
 463  014f 81            	ret
 501                     ; 101 s8 CH372_RD_DAT(void)
 501                     ; 102 {
 502                     	switch	.text
 503  0150               _CH372_RD_DAT:
 505  0150 88            	push	a
 506       00000001      OFST:	set	1
 509                     ; 105    GPIO_Init(CH372_DATA_PORT, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 511  0151 4b40          	push	#64
 512  0153 4bff          	push	#255
 513  0155 ae500f        	ldw	x,#20495
 514  0158 cd0000        	call	_GPIO_Init
 516  015b 85            	popw	x
 517                     ; 108    GPIO_ResetBits(CH372_AO_PORT, CH372_AO_PIN);
 519  015c 4b02          	push	#2
 520  015e ae5005        	ldw	x,#20485
 521  0161 cd0000        	call	_GPIO_ResetBits
 523  0164 84            	pop	a
 524                     ; 109    GPIO_ResetBits(CH372_CS_PORT, CH372_CS_PIN);
 526  0165 4b01          	push	#1
 527  0167 ae5005        	ldw	x,#20485
 528  016a cd0000        	call	_GPIO_ResetBits
 530  016d 84            	pop	a
 531                     ; 110    GPIO_ResetBits(CH372_RD_PORT, CH372_RD_PIN);
 533  016e 4b08          	push	#8
 534  0170 ae5005        	ldw	x,#20485
 535  0173 cd0000        	call	_GPIO_ResetBits
 537  0176 84            	pop	a
 538                     ; 114    Dat= GPIO_ReadInputData(CH372_DATA_PORT);
 540  0177 ae500f        	ldw	x,#20495
 541  017a cd0000        	call	_GPIO_ReadInputData
 543  017d 6b01          	ld	(OFST+0,sp),a
 545                     ; 116    GPIO_SetBits(CH372_RD_PORT, CH372_RD_PIN);
 547  017f 4b08          	push	#8
 548  0181 ae5005        	ldw	x,#20485
 549  0184 cd0000        	call	_GPIO_SetBits
 551  0187 84            	pop	a
 552                     ; 117    GPIO_SetBits(CH372_CS_PORT, CH372_CS_PIN);
 554  0188 4b01          	push	#1
 555  018a ae5005        	ldw	x,#20485
 556  018d cd0000        	call	_GPIO_SetBits
 558  0190 84            	pop	a
 559                     ; 119    return Dat;
 561  0191 7b01          	ld	a,(OFST+0,sp)
 564  0193 5b01          	addw	sp,#1
 565  0195 81            	ret
 578                     	xdef	_CH372_WR_DAT
 579                     	xdef	_Delay
 580                     	xdef	_CH372_RD_DAT
 581                     	xdef	_CH372_WR_CMD
 582                     	xdef	_CH372_Init
 583                     	xref	_GPIO_ReadInputData
 584                     	xref	_GPIO_ResetBits
 585                     	xref	_GPIO_SetBits
 586                     	xref	_GPIO_Write
 587                     	xref	_GPIO_ExternalPullUpConfig
 588                     	xref	_GPIO_Init
 589                     	xref	_EXTI_SetPinSensitivity
 590                     	xref	_EXTI_DeInit
 609                     	end
