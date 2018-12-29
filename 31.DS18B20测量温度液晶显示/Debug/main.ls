   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  14                     	bsct
  15  0000               _temper:
  16  0000 0000          	dc.w	0
  17  0002               _Ht1621Tab:
  18  0002 00            	dc.b	0
  19  0003 00            	dc.b	0
  20  0004 00            	dc.b	0
  21  0005 00            	dc.b	0
  61                     ; 31 void Delay(__IO uint16_t nCount)
  61                     ; 32 {
  63                     	switch	.text
  64  0000               _Delay:
  66  0000 89            	pushw	x
  67       00000000      OFST:	set	0
  70  0001 2007          	jra	L13
  71  0003               L72:
  72                     ; 36         nCount--;
  74  0003 1e01          	ldw	x,(OFST+1,sp)
  75  0005 1d0001        	subw	x,#1
  76  0008 1f01          	ldw	(OFST+1,sp),x
  77  000a               L13:
  78                     ; 34     while (nCount != 0)
  80  000a 1e01          	ldw	x,(OFST+1,sp)
  81  000c 26f5          	jrne	L72
  82                     ; 38 }
  85  000e 85            	popw	x
  86  000f 81            	ret
 123                     ; 45 void USART_SendStr(unsigned char *Str) 
 123                     ; 46 {
 124                     	switch	.text
 125  0010               _USART_SendStr:
 127  0010 89            	pushw	x
 128       00000000      OFST:	set	0
 131  0011 2020          	jra	L55
 132  0013               L35:
 133                     ; 49             USART_SendData8(USART1,*Str);     //发送数据 
 135  0013 1e01          	ldw	x,(OFST+1,sp)
 136  0015 f6            	ld	a,(x)
 137  0016 88            	push	a
 138  0017 ae5230        	ldw	x,#21040
 139  001a cd0000        	call	_USART_SendData8
 141  001d 84            	pop	a
 143  001e               L36:
 144                     ; 50             while(!USART_GetFlagStatus (USART1,USART_FLAG_TXE));//等待发送完毕
 146  001e ae0080        	ldw	x,#128
 147  0021 89            	pushw	x
 148  0022 ae5230        	ldw	x,#21040
 149  0025 cd0000        	call	_USART_GetFlagStatus
 151  0028 85            	popw	x
 152  0029 4d            	tnz	a
 153  002a 27f2          	jreq	L36
 154                     ; 51             Str++;//下一个数据
 156  002c 1e01          	ldw	x,(OFST+1,sp)
 157  002e 1c0001        	addw	x,#1
 158  0031 1f01          	ldw	(OFST+1,sp),x
 159  0033               L55:
 160                     ; 47         while(*Str!=0)//不为结束
 162  0033 1e01          	ldw	x,(OFST+1,sp)
 163  0035 7d            	tnz	(x)
 164  0036 26db          	jrne	L35
 165                     ; 53 }
 168  0038 85            	popw	x
 169  0039 81            	ret
 201                     ; 61 int main( void )
 201                     ; 62 {
 202                     	switch	.text
 203  003a               _main:
 207                     ; 63 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 209  003a 4f            	clr	a
 210  003b cd0000        	call	_CLK_SYSCLKDivConfig
 212                     ; 64   Ht1621_Init();        //上电初始化LCD 
 214  003e cd0000        	call	_Ht1621_Init
 216                     ; 65 	Delay(100);           //延时一段时间
 218  0041 ae0064        	ldw	x,#100
 219  0044 adba          	call	_Delay
 221  0046               L77:
 222                     ; 69     if(init_1820())
 224  0046 cd0000        	call	_init_1820
 226  0049 4d            	tnz	a
 227  004a 2705          	jreq	L301
 228                     ; 71           temper=gettemp();
 230  004c cd0000        	call	_gettemp
 232  004f bf00          	ldw	_temper,x
 233  0051               L301:
 234                     ; 73        data_convertor(temper);//在液晶上显示温度
 236  0051 be00          	ldw	x,_temper
 237  0053 cd0000        	call	c_uitolx
 239  0056 be02          	ldw	x,c_lreg+2
 240  0058 89            	pushw	x
 241  0059 be00          	ldw	x,c_lreg
 242  005b 89            	pushw	x
 243  005c cd0000        	call	_data_convertor
 245  005f 5b04          	addw	sp,#4
 246                     ; 74        Display();//显示 
 248  0061 cd0000        	call	_Display
 250                     ; 75        Display_lcd_dot();//显示小数点
 252  0064 cd0000        	call	_Display_lcd_dot
 255  0067 20dd          	jra	L77
 289                     	xdef	_main
 290                     	xdef	_USART_SendStr
 291                     	xdef	_Delay
 292                     	xdef	_Ht1621Tab
 293                     	xdef	_temper
 294                     	xref	_gettemp
 295                     	xref	_init_1820
 296                     	xref	_data_convertor
 297                     	xref	_Display_lcd_dot
 298                     	xref	_Display
 299                     	xref	_Ht1621_Init
 300                     	xref	_USART_GetFlagStatus
 301                     	xref	_USART_SendData8
 302                     	xref	_CLK_SYSCLKDivConfig
 303                     	xref.b	c_lreg
 322                     	xref	c_uitolx
 323                     	end
