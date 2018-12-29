   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  53                     ; 17 void Delay(__IO uint16_t nCount)
  53                     ; 18 {
  55                     	switch	.text
  56  0000               _Delay:
  58  0000 89            	pushw	x
  59       00000000      OFST:	set	0
  62  0001 2007          	jra	L13
  63  0003               L72:
  64                     ; 22         nCount--;
  66  0003 1e01          	ldw	x,(OFST+1,sp)
  67  0005 1d0001        	subw	x,#1
  68  0008 1f01          	ldw	(OFST+1,sp),x
  69  000a               L13:
  70                     ; 20     while (nCount != 0)
  72  000a 1e01          	ldw	x,(OFST+1,sp)
  73  000c 26f5          	jrne	L72
  74                     ; 24 }
  77  000e 85            	popw	x
  78  000f 81            	ret
  81                     	xref	_BMP1
 126                     ; 31 int main( void )
 126                     ; 32 {
 127                     	switch	.text
 128  0010               _main:
 130  0010 88            	push	a
 131       00000001      OFST:	set	1
 134                     ; 35     GPIO_Init(LED1_GPIO_PORT, LED1_GPIO_PINS, GPIO_Mode_Out_PP_Low_Slow);//初始化LED1接口
 136  0011 4bc0          	push	#192
 137  0013 4b10          	push	#16
 138  0015 ae500a        	ldw	x,#20490
 139  0018 cd0000        	call	_GPIO_Init
 141  001b 85            	popw	x
 142                     ; 36     CLK_PeripheralClockConfig (CLK_Peripheral_I2C1,ENABLE);//开启IIC1时钟门控
 144  001c ae0301        	ldw	x,#769
 145  001f cd0000        	call	_CLK_PeripheralClockConfig
 147                     ; 37     I2C_Configuration();
 149  0022 cd0000        	call	_I2C_Configuration
 151                     ; 39     Delay(0xFFFF);//需要延时一会
 153  0025 aeffff        	ldw	x,#65535
 154  0028 add6          	call	_Delay
 156                     ; 40     OLED_Init(); 
 158  002a cd0000        	call	_OLED_Init
 160  002d               L35:
 161                     ; 46       OLED_Fill(0xFF);//全屏点亮
 163  002d a6ff          	ld	a,#255
 164  002f cd0000        	call	_OLED_Fill
 166                     ; 47       OLED_Fill(0x00);//全屏灭
 168  0032 4f            	clr	a
 169  0033 cd0000        	call	_OLED_Fill
 171                     ; 48       for(i=0;i<5;i++)
 173  0036 0f01          	clr	(OFST+0,sp)
 175  0038               L75:
 176                     ; 50 				OLED_ShowCN(22+i*16,0,i);//测试显示中文
 178  0038 7b01          	ld	a,(OFST+0,sp)
 179  003a 88            	push	a
 180  003b 7b02          	ld	a,(OFST+1,sp)
 181  003d 97            	ld	xl,a
 182  003e a610          	ld	a,#16
 183  0040 42            	mul	x,a
 184  0041 9f            	ld	a,xl
 185  0042 ab16          	add	a,#22
 186  0044 5f            	clrw	x
 187  0045 95            	ld	xh,a
 188  0046 cd0000        	call	_OLED_ShowCN
 190  0049 84            	pop	a
 191                     ; 48       for(i=0;i<5;i++)
 193  004a 0c01          	inc	(OFST+0,sp)
 197  004c 7b01          	ld	a,(OFST+0,sp)
 198  004e a105          	cp	a,#5
 199  0050 25e6          	jrult	L75
 200                     ; 52       OLED_ShowStr(0,3,"WuXI NANO IOE Co.,Ltd",1);//测试6*8字符
 202  0052 4b01          	push	#1
 203  0054 ae0015        	ldw	x,#L56
 204  0057 89            	pushw	x
 205  0058 ae0003        	ldw	x,#3
 206  005b cd0000        	call	_OLED_ShowStr
 208  005e 5b03          	addw	sp,#3
 209                     ; 53       OLED_ShowStr(4,4,"LENCHIMCU.TAOBAO.COM",1);
 211  0060 4b01          	push	#1
 212  0062 ae0000        	ldw	x,#L76
 213  0065 89            	pushw	x
 214  0066 ae0404        	ldw	x,#1028
 215  0069 cd0000        	call	_OLED_ShowStr
 217  006c 5b03          	addw	sp,#3
 218                     ; 54       Delay(0xFFFF);//延时，便于观察实验现象
 220  006e aeffff        	ldw	x,#65535
 221  0071 ad8d          	call	_Delay
 223                     ; 55       Delay(0xFFFF);//延时，便于观察实验现象
 225  0073 aeffff        	ldw	x,#65535
 226  0076 ad88          	call	_Delay
 228                     ; 56       Delay(0xFFFF);//延时，便于观察实验现象
 230  0078 aeffff        	ldw	x,#65535
 231  007b ad83          	call	_Delay
 233                     ; 57       Delay(0xFFFF);//延时，便于观察实验现象
 235  007d aeffff        	ldw	x,#65535
 236  0080 cd0000        	call	_Delay
 238                     ; 58       OLED_CLS();//清屏
 240  0083 cd0000        	call	_OLED_CLS
 242                     ; 59       OLED_OFF();//测试OLED休眠
 244  0086 cd0000        	call	_OLED_OFF
 246                     ; 60       OLED_ON();//测试OLED休眠后唤醒
 248  0089 cd0000        	call	_OLED_ON
 250                     ; 61       OLED_DrawBMP(0,0,128,8,(unsigned char *)BMP1);//测试BMP位图显示
 252  008c ae0000        	ldw	x,#_BMP1
 253  008f 89            	pushw	x
 254  0090 4b08          	push	#8
 255  0092 4b80          	push	#128
 256  0094 5f            	clrw	x
 257  0095 cd0000        	call	_OLED_DrawBMP
 259  0098 5b04          	addw	sp,#4
 260                     ; 62       GPIO_ToggleBits(LED1_GPIO_PORT, LED1_GPIO_PINS);//翻转LED1接口电平，实现LED1闪烁
 262  009a 4b10          	push	#16
 263  009c ae500a        	ldw	x,#20490
 264  009f cd0000        	call	_GPIO_ToggleBits
 266  00a2 84            	pop	a
 267                     ; 63       Delay(0xFFFF);//延时，便于观察实验现象
 269  00a3 aeffff        	ldw	x,#65535
 270  00a6 cd0000        	call	_Delay
 272                     ; 64       Delay(0xFFFF);//延时，便于观察实验现象
 274  00a9 aeffff        	ldw	x,#65535
 275  00ac cd0000        	call	_Delay
 277                     ; 65       Delay(0xFFFF);//延时，便于观察实验现象
 279  00af aeffff        	ldw	x,#65535
 280  00b2 cd0000        	call	_Delay
 282                     ; 66       Delay(0xFFFF);//延时，便于观察实验现象
 284  00b5 aeffff        	ldw	x,#65535
 285  00b8 cd0000        	call	_Delay
 288  00bb ac2d002d      	jpf	L35
 301                     	xdef	_main
 302                     	xdef	_Delay
 303                     	xref	_OLED_DrawBMP
 304                     	xref	_OLED_ShowCN
 305                     	xref	_OLED_ShowStr
 306                     	xref	_OLED_OFF
 307                     	xref	_OLED_ON
 308                     	xref	_OLED_CLS
 309                     	xref	_OLED_Fill
 310                     	xref	_OLED_Init
 311                     	xref	_I2C_Configuration
 312                     	xref	_GPIO_ToggleBits
 313                     	xref	_GPIO_Init
 314                     	xref	_CLK_PeripheralClockConfig
 315                     .const:	section	.text
 316  0000               L76:
 317  0000 4c454e434849  	dc.b	"LENCHIMCU.TAOBAO.C"
 318  0012 4f4d00        	dc.b	"OM",0
 319  0015               L56:
 320  0015 57755849204e  	dc.b	"WuXI NANO IOE Co.,"
 321  0027 4c746400      	dc.b	"Ltd",0
 341                     	end
