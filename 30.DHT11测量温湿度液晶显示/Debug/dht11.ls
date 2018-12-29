   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  71                     ; 21 void delay_ms(int value){
  73                     	switch	.text
  74  0000               _delay_ms:
  76  0000 89            	pushw	x
  77  0001 5204          	subw	sp,#4
  78       00000004      OFST:	set	4
  81                     ; 23   if(value<1)
  83  0003 9c            	rvf
  84  0004 a30001        	cpw	x,#1
  85  0007 2e05          	jrsge	L73
  86                     ; 24     value = 1;
  88  0009 ae0001        	ldw	x,#1
  89  000c 1f05          	ldw	(OFST+1,sp),x
  90  000e               L73:
  91                     ; 25   for(i=0;i!=value;i++)
  93  000e 5f            	clrw	x
  94  000f 1f01          	ldw	(OFST-3,sp),x
  97  0011 2018          	jra	L54
  98  0013               L14:
  99                     ; 26     for(j=0;j!=5000;++j);
 101  0013 5f            	clrw	x
 102  0014 1f03          	ldw	(OFST-1,sp),x
 104  0016               L15:
 108  0016 1e03          	ldw	x,(OFST-1,sp)
 109  0018 1c0001        	addw	x,#1
 110  001b 1f03          	ldw	(OFST-1,sp),x
 114  001d 1e03          	ldw	x,(OFST-1,sp)
 115  001f a31388        	cpw	x,#5000
 116  0022 26f2          	jrne	L15
 117                     ; 25   for(i=0;i!=value;i++)
 119  0024 1e01          	ldw	x,(OFST-3,sp)
 120  0026 1c0001        	addw	x,#1
 121  0029 1f01          	ldw	(OFST-3,sp),x
 123  002b               L54:
 126  002b 1e01          	ldw	x,(OFST-3,sp)
 127  002d 1305          	cpw	x,(OFST+1,sp)
 128  002f 26e2          	jrne	L14
 129                     ; 27 } 
 132  0031 5b06          	addw	sp,#6
 133  0033 81            	ret
 176                     ; 37 void Delay_us(u32 nCount)  
 176                     ; 38 {
 177                     	switch	.text
 178  0034               _Delay_us:
 180  0034 88            	push	a
 181       00000001      OFST:	set	1
 184                     ; 40 	for(i=0;i<5;i++) 
 186  0035 0f01          	clr	(OFST+0,sp)
 188  0037 2009          	jra	L111
 189  0039               L701:
 190                     ; 44       nCount--; 
 192  0039 96            	ldw	x,sp
 193  003a 1c0004        	addw	x,#OFST+3
 194  003d a601          	ld	a,#1
 195  003f cd0000        	call	c_lgsbc
 197  0042               L111:
 198                     ; 42     while (nCount != 0) 
 200  0042 96            	ldw	x,sp
 201  0043 1c0004        	addw	x,#OFST+3
 202  0046 cd0000        	call	c_lzmp
 204  0049 26ee          	jrne	L701
 205                     ; 40 	for(i=0;i<5;i++) 
 207  004b 0c01          	inc	(OFST+0,sp)
 211  004d 7b01          	ld	a,(OFST+0,sp)
 212  004f a105          	cp	a,#5
 213  0051 25ef          	jrult	L111
 214                     ; 47 }  
 217  0053 84            	pop	a
 218  0054 81            	ret
 242                     ; 57 void DHT11_Init(void) 
 242                     ; 58 { 
 243                     	switch	.text
 244  0055               _DHT11_Init:
 248                     ; 59     GPIO_DeInit(GPIOD);  
 250  0055 ae500f        	ldw	x,#20495
 251  0058 cd0000        	call	_GPIO_DeInit
 253                     ; 61 } 
 256  005b 81            	ret
 285                     ; 71 unsigned int DHT11_Start(void)
 285                     ; 72 { 
 286                     	switch	.text
 287  005c               _DHT11_Start:
 291                     ; 73   DHT11_OUT;      //设置端口方向
 293  005c 4bf0          	push	#240
 294  005e 4b10          	push	#16
 295  0060 ae500f        	ldw	x,#20495
 296  0063 cd0000        	call	_GPIO_Init
 298  0066 85            	popw	x
 299                     ; 74   DHT11_CLR;      //拉低端口
 302  0067 4b10          	push	#16
 303  0069 ae500f        	ldw	x,#20495
 304  006c cd0000        	call	_GPIO_ResetBits
 306  006f 84            	pop	a
 307                     ; 75   delay_ms(5);   //持续最低18ms
 310  0070 ae0005        	ldw	x,#5
 311  0073 ad8b          	call	_delay_ms
 313                     ; 76   DHT11_SET;      //释放总线
 315  0075 4b10          	push	#16
 316  0077 ae500f        	ldw	x,#20495
 317  007a cd0000        	call	_GPIO_SetBits
 319  007d 84            	pop	a
 320                     ; 78   Delay_us(22);
 323  007e ae0016        	ldw	x,#22
 324  0081 89            	pushw	x
 325  0082 ae0000        	ldw	x,#0
 326  0085 89            	pushw	x
 327  0086 adac          	call	_Delay_us
 329  0088 5b04          	addw	sp,#4
 330                     ; 80   DHT11_IN;      //设置端口方向
 332  008a 4b40          	push	#64
 333  008c 4b10          	push	#16
 334  008e ae500f        	ldw	x,#20495
 335  0091 cd0000        	call	_GPIO_Init
 337  0094 85            	popw	x
 340  0095               L731:
 341                     ; 82   while(!GPIO_ReadInputDataBit(DHT11_PORT,DHT11_PIN));//DHT11   等待80us低电平响应信号结束
 343  0095 4b10          	push	#16
 344  0097 ae500f        	ldw	x,#20495
 345  009a cd0000        	call	_GPIO_ReadInputDataBit
 347  009d 5b01          	addw	sp,#1
 348  009f 4d            	tnz	a
 349  00a0 27f3          	jreq	L731
 351  00a2               L541:
 352                     ; 83   while(GPIO_ReadInputDataBit(DHT11_PORT,DHT11_PIN));//DHT11   将总线拉高80us
 354  00a2 4b10          	push	#16
 355  00a4 ae500f        	ldw	x,#20495
 356  00a7 cd0000        	call	_GPIO_ReadInputDataBit
 358  00aa 5b01          	addw	sp,#1
 359  00ac 4d            	tnz	a
 360  00ad 26f3          	jrne	L541
 361                     ; 85   return 1;
 363  00af ae0001        	ldw	x,#1
 366  00b2 81            	ret
 411                     ; 96 unsigned char DHT11_ReadValue(void)
 411                     ; 97 { 
 412                     	switch	.text
 413  00b3               _DHT11_ReadValue:
 415  00b3 89            	pushw	x
 416       00000002      OFST:	set	2
 419                     ; 98   unsigned char i,sbuf=0;
 421  00b4 0f02          	clr	(OFST+0,sp)
 423                     ; 100   for(i=8;i>0;i--)
 425  00b6 a608          	ld	a,#8
 426  00b8 6b01          	ld	(OFST-1,sp),a
 428  00ba               L371:
 429                     ; 102     sbuf<<=1; 
 431  00ba 0802          	sll	(OFST+0,sp)
 434  00bc               L302:
 435                     ; 103     while((!GPIO_ReadInputDataBit(DHT11_PORT,DHT11_PIN)));//50us的开始低电平
 437  00bc 4b10          	push	#16
 438  00be ae500f        	ldw	x,#20495
 439  00c1 cd0000        	call	_GPIO_ReadInputDataBit
 441  00c4 5b01          	addw	sp,#1
 442  00c6 4d            	tnz	a
 443  00c7 27f3          	jreq	L302
 444                     ; 104     Delay_us(22);// 延时 30us 后检测数据线是否还是高电平 
 446  00c9 ae0016        	ldw	x,#22
 447  00cc 89            	pushw	x
 448  00cd ae0000        	ldw	x,#0
 449  00d0 89            	pushw	x
 450  00d1 cd0034        	call	_Delay_us
 452  00d4 5b04          	addw	sp,#4
 453                     ; 105     if(GPIO_ReadInputDataBit(DHT11_PORT,DHT11_PIN))
 455  00d6 4b10          	push	#16
 456  00d8 ae500f        	ldw	x,#20495
 457  00db cd0000        	call	_GPIO_ReadInputDataBit
 459  00de 5b01          	addw	sp,#1
 460  00e0 4d            	tnz	a
 461  00e1 2706          	jreq	L702
 462                     ; 107       sbuf|=1;  
 464  00e3 7b02          	ld	a,(OFST+0,sp)
 465  00e5 aa01          	or	a,#1
 466  00e7 6b02          	ld	(OFST+0,sp),a
 469  00e9               L702:
 470                     ; 111       sbuf|=0;
 472  00e9               L512:
 473                     ; 113     while(GPIO_ReadInputDataBit(DHT11_PORT,DHT11_PIN));
 475  00e9 4b10          	push	#16
 476  00eb ae500f        	ldw	x,#20495
 477  00ee cd0000        	call	_GPIO_ReadInputDataBit
 479  00f1 5b01          	addw	sp,#1
 480  00f3 4d            	tnz	a
 481  00f4 26f3          	jrne	L512
 482                     ; 100   for(i=8;i>0;i--)
 484  00f6 0a01          	dec	(OFST-1,sp)
 488  00f8 0d01          	tnz	(OFST-1,sp)
 489  00fa 26be          	jrne	L371
 490                     ; 115   return sbuf;   
 492  00fc 7b02          	ld	a,(OFST+0,sp)
 495  00fe 85            	popw	x
 496  00ff 81            	ret
 541                     ; 126 unsigned char Get_data(unsigned char *buf)
 541                     ; 127 {
 542                     	switch	.text
 543  0100               _Get_data:
 545  0100 89            	pushw	x
 546  0101 5203          	subw	sp,#3
 547       00000003      OFST:	set	3
 550                     ; 130     buf[0]=DHT11_ReadValue();
 552  0103 adae          	call	_DHT11_ReadValue
 554  0105 1e04          	ldw	x,(OFST+1,sp)
 555  0107 f7            	ld	(x),a
 556                     ; 132     buf[1]=DHT11_ReadValue();
 558  0108 ada9          	call	_DHT11_ReadValue
 560  010a 1e04          	ldw	x,(OFST+1,sp)
 561  010c e701          	ld	(1,x),a
 562                     ; 134     buf[2]=DHT11_ReadValue();
 564  010e ada3          	call	_DHT11_ReadValue
 566  0110 1e04          	ldw	x,(OFST+1,sp)
 567  0112 e702          	ld	(2,x),a
 568                     ; 136     buf[3]=DHT11_ReadValue();
 570  0114 ad9d          	call	_DHT11_ReadValue
 572  0116 1e04          	ldw	x,(OFST+1,sp)
 573  0118 e703          	ld	(3,x),a
 574                     ; 138     check =DHT11_ReadValue();
 576  011a ad97          	call	_DHT11_ReadValue
 578  011c 6b03          	ld	(OFST+0,sp),a
 580                     ; 140     if(check == buf[0]+buf[1]+buf[2]+buf[3])
 582  011e 7b03          	ld	a,(OFST+0,sp)
 583  0120 5f            	clrw	x
 584  0121 97            	ld	xl,a
 585  0122 1f01          	ldw	(OFST-2,sp),x
 587  0124 1e04          	ldw	x,(OFST+1,sp)
 588  0126 e601          	ld	a,(1,x)
 589  0128 5f            	clrw	x
 590  0129 1604          	ldw	y,(OFST+1,sp)
 591  012b 90fb          	add	a,(y)
 592  012d 2401          	jrnc	L02
 593  012f 5c            	incw	x
 594  0130               L02:
 595  0130 1604          	ldw	y,(OFST+1,sp)
 596  0132 90eb02        	add	a,(2,y)
 597  0135 2401          	jrnc	L22
 598  0137 5c            	incw	x
 599  0138               L22:
 600  0138 1604          	ldw	y,(OFST+1,sp)
 601  013a 90eb03        	add	a,(3,y)
 602  013d 2401          	jrnc	L42
 603  013f 5c            	incw	x
 604  0140               L42:
 605  0140 02            	rlwa	x,a
 606  0141 1301          	cpw	x,(OFST-2,sp)
 607  0143 2604          	jrne	L342
 608                     ; 141         return 1;
 610  0145 a601          	ld	a,#1
 612  0147 2001          	jra	L62
 613  0149               L342:
 614                     ; 143         return 0;
 616  0149 4f            	clr	a
 618  014a               L62:
 620  014a 5b05          	addw	sp,#5
 621  014c 81            	ret
 634                     	xdef	_Delay_us
 635                     	xdef	_delay_ms
 636                     	xdef	_Get_data
 637                     	xdef	_DHT11_ReadValue
 638                     	xdef	_DHT11_Start
 639                     	xdef	_DHT11_Init
 640                     	xref	_GPIO_ReadInputDataBit
 641                     	xref	_GPIO_ResetBits
 642                     	xref	_GPIO_SetBits
 643                     	xref	_GPIO_Init
 644                     	xref	_GPIO_DeInit
 663                     	xref	c_lzmp
 664                     	xref	c_lgsbc
 665                     	end
