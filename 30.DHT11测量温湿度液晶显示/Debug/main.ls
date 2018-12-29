   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  14                     	bsct
  15  0000               _Ht1621Tab:
  16  0000 00            	dc.b	0
  17  0001 00            	dc.b	0
  18  0002 00            	dc.b	0
  19  0003 00            	dc.b	0
  59                     ; 32 void Delay(__IO uint16_t nCount)
  59                     ; 33 {
  61                     	switch	.text
  62  0000               _Delay:
  64  0000 89            	pushw	x
  65       00000000      OFST:	set	0
  68  0001 2007          	jra	L13
  69  0003               L72:
  70                     ; 37         nCount--;
  72  0003 1e01          	ldw	x,(OFST+1,sp)
  73  0005 1d0001        	subw	x,#1
  74  0008 1f01          	ldw	(OFST+1,sp),x
  75  000a               L13:
  76                     ; 35     while (nCount != 0)
  78  000a 1e01          	ldw	x,(OFST+1,sp)
  79  000c 26f5          	jrne	L72
  80                     ; 39 }
  83  000e 85            	popw	x
  84  000f 81            	ret
 121                     ; 46 void USART_SendStr(unsigned char *Str) 
 121                     ; 47 {
 122                     	switch	.text
 123  0010               _USART_SendStr:
 125  0010 89            	pushw	x
 126       00000000      OFST:	set	0
 129  0011 2020          	jra	L55
 130  0013               L35:
 131                     ; 50             USART_SendData8(USART1,*Str);     //发送数据 
 133  0013 1e01          	ldw	x,(OFST+1,sp)
 134  0015 f6            	ld	a,(x)
 135  0016 88            	push	a
 136  0017 ae5230        	ldw	x,#21040
 137  001a cd0000        	call	_USART_SendData8
 139  001d 84            	pop	a
 141  001e               L36:
 142                     ; 51             while(!USART_GetFlagStatus (USART1,USART_FLAG_TXE));//等待发送完毕
 144  001e ae0080        	ldw	x,#128
 145  0021 89            	pushw	x
 146  0022 ae5230        	ldw	x,#21040
 147  0025 cd0000        	call	_USART_GetFlagStatus
 149  0028 85            	popw	x
 150  0029 4d            	tnz	a
 151  002a 27f2          	jreq	L36
 152                     ; 52             Str++;//下一个数据
 154  002c 1e01          	ldw	x,(OFST+1,sp)
 155  002e 1c0001        	addw	x,#1
 156  0031 1f01          	ldw	(OFST+1,sp),x
 157  0033               L55:
 158                     ; 48         while(*Str!=0)//不为结束
 160  0033 1e01          	ldw	x,(OFST+1,sp)
 161  0035 7d            	tnz	(x)
 162  0036 26db          	jrne	L35
 163                     ; 54 }
 166  0038 85            	popw	x
 167  0039 81            	ret
 201                     ; 62 int main( void )
 201                     ; 63 {
 202                     	switch	.text
 203  003a               _main:
 205  003a 88            	push	a
 206       00000001      OFST:	set	1
 209                     ; 64 	  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 211  003b 4f            	clr	a
 212  003c cd0000        	call	_CLK_SYSCLKDivConfig
 214                     ; 65 	  Ht1621_Init();        //上电初始化LCD 
 216  003f cd0000        	call	_Ht1621_Init
 218                     ; 66 	  Delay(100);           //延时一段时间
 220  0042 ae0064        	ldw	x,#100
 221  0045 adb9          	call	_Delay
 223  0047               L501:
 224                     ; 70        while(!DHT11_Start());
 226  0047 cd0000        	call	_DHT11_Start
 228  004a a30000        	cpw	x,#0
 229  004d 27f8          	jreq	L501
 231  004f               L311:
 232                     ; 72        while(!Get_data(DHTData));
 234  004f ae0002        	ldw	x,#_DHTData
 235  0052 cd0000        	call	_Get_data
 237  0055 4d            	tnz	a
 238  0056 27f7          	jreq	L311
 239                     ; 73        Delay(0xFFFF);
 241  0058 aeffff        	ldw	x,#65535
 242  005b ada3          	call	_Delay
 244                     ; 74        Delay(0xFFFF); 
 246  005d aeffff        	ldw	x,#65535
 247  0060 ad9e          	call	_Delay
 249                     ; 75        Delay(0xFFFF); 
 251  0062 aeffff        	ldw	x,#65535
 252  0065 ad99          	call	_Delay
 254                     ; 76        Delay(0xFFFF);
 256  0067 aeffff        	ldw	x,#65535
 257  006a ad94          	call	_Delay
 259                     ; 77        Temp=(DHTData[2]>>4)*16+(DHTData[2]&0x0f);
 261  006c b604          	ld	a,_DHTData+2
 262  006e a40f          	and	a,#15
 263  0070 6b01          	ld	(OFST+0,sp),a
 265  0072 b604          	ld	a,_DHTData+2
 266  0074 4e            	swap	a
 267  0075 a40f          	and	a,#15
 268  0077 97            	ld	xl,a
 269  0078 a610          	ld	a,#16
 270  007a 42            	mul	x,a
 271  007b 9f            	ld	a,xl
 272  007c 1b01          	add	a,(OFST+0,sp)
 273  007e b701          	ld	_Temp,a
 274                     ; 78        Humi=(DHTData[0]>>4)*16+(DHTData[0]&0x0f);
 276  0080 b602          	ld	a,_DHTData
 277  0082 a40f          	and	a,#15
 278  0084 6b01          	ld	(OFST+0,sp),a
 280  0086 b602          	ld	a,_DHTData
 281  0088 4e            	swap	a
 282  0089 a40f          	and	a,#15
 283  008b 97            	ld	xl,a
 284  008c a610          	ld	a,#16
 285  008e 42            	mul	x,a
 286  008f 9f            	ld	a,xl
 287  0090 1b01          	add	a,(OFST+0,sp)
 288  0092 b700          	ld	_Humi,a
 289                     ; 79        data_convertor(Temp*100);//在液晶上显示温度
 291  0094 b601          	ld	a,_Temp
 292  0096 97            	ld	xl,a
 293  0097 a664          	ld	a,#100
 294  0099 42            	mul	x,a
 295  009a cd0000        	call	c_itolx
 297  009d be02          	ldw	x,c_lreg+2
 298  009f 89            	pushw	x
 299  00a0 be00          	ldw	x,c_lreg
 300  00a2 89            	pushw	x
 301  00a3 cd0000        	call	_data_convertor
 303  00a6 5b04          	addw	sp,#4
 304                     ; 80        Display();//显示
 306  00a8 cd0000        	call	_Display
 308                     ; 81        Display_lcd_dot();//显示小数点
 310  00ab cd0000        	call	_Display_lcd_dot
 312                     ; 83        Delay(0xFFFF);
 314  00ae aeffff        	ldw	x,#65535
 315  00b1 cd0000        	call	_Delay
 317                     ; 84        Delay(0xFFFF);
 319  00b4 aeffff        	ldw	x,#65535
 320  00b7 cd0000        	call	_Delay
 322                     ; 85        Delay(0xFFFF);
 324  00ba aeffff        	ldw	x,#65535
 325  00bd cd0000        	call	_Delay
 327                     ; 86        Delay(0xFFFF);
 329  00c0 aeffff        	ldw	x,#65535
 330  00c3 cd0000        	call	_Delay
 332                     ; 87        Delay(0xFFFF);
 334  00c6 aeffff        	ldw	x,#65535
 335  00c9 cd0000        	call	_Delay
 337                     ; 88        Delay(0xFFFF);
 339  00cc aeffff        	ldw	x,#65535
 340  00cf cd0000        	call	_Delay
 342                     ; 89        Delay(0xFFFF);
 344  00d2 aeffff        	ldw	x,#65535
 345  00d5 cd0000        	call	_Delay
 347                     ; 90        Delay(0xFFFF);
 349  00d8 aeffff        	ldw	x,#65535
 350  00db cd0000        	call	_Delay
 352                     ; 91        Delay(0xFFFF);
 354  00de aeffff        	ldw	x,#65535
 355  00e1 cd0000        	call	_Delay
 357                     ; 92        Delay(0xFFFF);
 359  00e4 aeffff        	ldw	x,#65535
 360  00e7 cd0000        	call	_Delay
 362                     ; 93        data_convertor(Humi*100);//在液晶上显示湿度
 364  00ea b600          	ld	a,_Humi
 365  00ec 97            	ld	xl,a
 366  00ed a664          	ld	a,#100
 367  00ef 42            	mul	x,a
 368  00f0 cd0000        	call	c_itolx
 370  00f3 be02          	ldw	x,c_lreg+2
 371  00f5 89            	pushw	x
 372  00f6 be00          	ldw	x,c_lreg
 373  00f8 89            	pushw	x
 374  00f9 cd0000        	call	_data_convertor
 376  00fc 5b04          	addw	sp,#4
 377                     ; 94        Display();//显示
 379  00fe cd0000        	call	_Display
 381                     ; 95        Display_lcd_dot();//显示小数点
 383  0101 cd0000        	call	_Display_lcd_dot
 385                     ; 96        Delay(0xFFFF);
 387  0104 aeffff        	ldw	x,#65535
 388  0107 cd0000        	call	_Delay
 390                     ; 97        Delay(0xFFFF);
 392  010a aeffff        	ldw	x,#65535
 393  010d cd0000        	call	_Delay
 395                     ; 98        Delay(0xFFFF);
 397  0110 aeffff        	ldw	x,#65535
 398  0113 cd0000        	call	_Delay
 400                     ; 99        Delay(0xFFFF);
 402  0116 aeffff        	ldw	x,#65535
 403  0119 cd0000        	call	_Delay
 405                     ; 100        Delay(0xFFFF);
 407  011c aeffff        	ldw	x,#65535
 408  011f cd0000        	call	_Delay
 410                     ; 101        Delay(0xFFFF);
 412  0122 aeffff        	ldw	x,#65535
 413  0125 cd0000        	call	_Delay
 415                     ; 102        Delay(0xFFFF);
 417  0128 aeffff        	ldw	x,#65535
 418  012b cd0000        	call	_Delay
 420                     ; 103        Delay(0xFFFF);
 422  012e aeffff        	ldw	x,#65535
 423  0131 cd0000        	call	_Delay
 425                     ; 104        Delay(0xFFFF);
 427  0134 aeffff        	ldw	x,#65535
 428  0137 cd0000        	call	_Delay
 430                     ; 105        Delay(0xFFFF);   
 432  013a aeffff        	ldw	x,#65535
 433  013d cd0000        	call	_Delay
 436  0140 ac470047      	jpf	L501
 489                     	xdef	_main
 490                     	xdef	_USART_SendStr
 491                     	xdef	_Delay
 492                     	xdef	_Ht1621Tab
 493                     	switch	.ubsct
 494  0000               _Humi:
 495  0000 00            	ds.b	1
 496                     	xdef	_Humi
 497  0001               _Temp:
 498  0001 00            	ds.b	1
 499                     	xdef	_Temp
 500  0002               _DHTData:
 501  0002 00000000      	ds.b	4
 502                     	xdef	_DHTData
 503                     	xref	_Get_data
 504                     	xref	_DHT11_Start
 505                     	xref	_data_convertor
 506                     	xref	_Display_lcd_dot
 507                     	xref	_Display
 508                     	xref	_Ht1621_Init
 509                     	xref	_USART_GetFlagStatus
 510                     	xref	_USART_SendData8
 511                     	xref	_CLK_SYSCLKDivConfig
 512                     	xref.b	c_lreg
 532                     	xref	c_itolx
 533                     	end
