   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  14                     	bsct
  15  0000               _NonAlowedRefresh:
  16  0000 00            	dc.b	0
  17  0001               _AllowedRefresh:
  18  0001 01            	dc.b	1
  58                     ; 31 void Delay(__IO uint16_t nCount)
  58                     ; 32 {
  60                     	switch	.text
  61  0000               _Delay:
  63  0000 89            	pushw	x
  64       00000000      OFST:	set	0
  67  0001 2007          	jra	L13
  68  0003               L72:
  69                     ; 36         nCount--;
  71  0003 1e01          	ldw	x,(OFST+1,sp)
  72  0005 1d0001        	subw	x,#1
  73  0008 1f01          	ldw	(OFST+1,sp),x
  74  000a               L13:
  75                     ; 34     while (nCount != 0)
  77  000a 1e01          	ldw	x,(OFST+1,sp)
  78  000c 26f5          	jrne	L72
  79                     ; 38 }
  82  000e 85            	popw	x
  83  000f 81            	ret
 107                     ; 46 static void WWDG_Config(void) 
 107                     ; 47 {
 108                     	switch	.text
 109  0010               L53_WWDG_Config:
 113                     ; 65   WWDG_Init(COUNTER_INIT, WINDOW_VALUE);
 115  0010 ae6861        	ldw	x,#26721
 116  0013 cd0000        	call	_WWDG_Init
 118                     ; 66 }
 121  0016 81            	ret
 158                     ; 77 int main( void )
 158                     ; 78 {  
 159                     	switch	.text
 160  0017               _main:
 164                     ; 79   GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);//初始化LED端口
 166  0017 4bc0          	push	#192
 167  0019 4b10          	push	#16
 168  001b ae500a        	ldw	x,#20490
 169  001e cd0000        	call	_GPIO_Init
 171  0021 85            	popw	x
 172                     ; 80   GPIO_Init(LED2_PORT,LED2_PINS,GPIO_Mode_Out_PP_Low_Slow);//初始化LED端口
 174  0022 4bc0          	push	#192
 175  0024 4b01          	push	#1
 176  0026 ae5005        	ldw	x,#20485
 177  0029 cd0000        	call	_GPIO_Init
 179  002c 85            	popw	x
 180                     ; 82   GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，上拉输入，带中断
 182  002d 4b60          	push	#96
 183  002f 4b10          	push	#16
 184  0031 ae500f        	ldw	x,#20495
 185  0034 cd0000        	call	_GPIO_Init
 187  0037 85            	popw	x
 188                     ; 83   GPIO_Init(KEY2_PORT, KEY2_PINS, GPIO_Mode_In_PU_IT);//初始化按键，上拉输入，带中断 
 190  0038 4b60          	push	#96
 191  003a 4b04          	push	#4
 192  003c ae5000        	ldw	x,#20480
 193  003f cd0000        	call	_GPIO_Init
 195  0042 85            	popw	x
 196                     ; 85   EXTI_DeInit (); //恢复中断的所有设置 
 198  0043 cd0000        	call	_EXTI_DeInit
 200                     ; 86   EXTI_SetPinSensitivity (EXTI_Pin_2,EXTI_Trigger_Falling);//外部中断2，下降沿触发，向量号10
 202  0046 ae0402        	ldw	x,#1026
 203  0049 cd0000        	call	_EXTI_SetPinSensitivity
 205                     ; 87   EXTI_SetPinSensitivity (EXTI_Pin_3,EXTI_Trigger_Falling);//外部中断3，下降沿触发，向量号11
 207  004c ae0602        	ldw	x,#1538
 208  004f cd0000        	call	_EXTI_SetPinSensitivity
 210                     ; 89   enableInterrupts();//使能中断
 213  0052 9a            rim
 215                     ; 92   if (RST_GetFlagStatus(RST_FLAG_WWDGF) != RESET)
 218  0053 a610          	ld	a,#16
 219  0055 cd0000        	call	_RST_GetFlagStatus
 221  0058 4d            	tnz	a
 222  0059 271d          	jreq	L75
 223                     ; 94      for (Index = 7; Index != 0; Index--)
 225  005b 35070000      	mov	_Index,#7
 226  005f               L16:
 227                     ; 96       GPIO_ToggleBits(LED2_PORT,LED2_PINS);
 229  005f 4b01          	push	#1
 230  0061 ae5005        	ldw	x,#20485
 231  0064 cd0000        	call	_GPIO_ToggleBits
 233  0067 84            	pop	a
 234                     ; 97       Delay(0x7FFF);
 236  0068 ae7fff        	ldw	x,#32767
 237  006b ad93          	call	_Delay
 239                     ; 94      for (Index = 7; Index != 0; Index--)
 241  006d 3a00          	dec	_Index
 244  006f 3d00          	tnz	_Index
 245  0071 26ec          	jrne	L16
 246                     ; 99     RST_ClearFlag(RST_FLAG_WWDGF);//清掉复位源标志
 248  0073 a610          	ld	a,#16
 249  0075 cd0000        	call	_RST_ClearFlag
 251  0078               L75:
 252                     ; 102   WWDG_Config();//WWDG配置
 254  0078 ad96          	call	L53_WWDG_Config
 256  007a               L76:
 257                     ; 108     if (AllowedRefresh != DISABLE)
 259  007a 3d01          	tnz	_AllowedRefresh
 260  007c 270e          	jreq	L37
 262  007e               L77:
 263                     ; 110       while ((WWDG_GetCounter() & 0x7F) > WINDOW_VALUE);//等待WWDG递减计数器的值小于窗口值时再去喂狗，则不会引起复位
 265  007e cd0000        	call	_WWDG_GetCounter
 267  0081 a47f          	and	a,#127
 268  0083 a162          	cp	a,#98
 269  0085 24f7          	jruge	L77
 270                     ; 111       WWDG_SetCounter(COUNTER_INIT);//喂狗
 272  0087 a668          	ld	a,#104
 273  0089 cd0000        	call	_WWDG_SetCounter
 275  008c               L37:
 276                     ; 114     if (NonAlowedRefresh != DISABLE)
 278  008c 3d00          	tnz	_NonAlowedRefresh
 279  008e 270e          	jreq	L301
 281  0090               L701:
 282                     ; 116       while ((WWDG_GetCounter() & 0x7F) < WINDOW_VALUE);//在大于窗口值
 284  0090 cd0000        	call	_WWDG_GetCounter
 286  0093 a47f          	and	a,#127
 287  0095 a161          	cp	a,#97
 288  0097 25f7          	jrult	L701
 289                     ; 117       WWDG_SetCounter(COUNTER_INIT);//喂狗
 291  0099 a668          	ld	a,#104
 292  009b cd0000        	call	_WWDG_SetCounter
 294  009e               L301:
 295                     ; 120     GPIO_ToggleBits(LED1_PORT,LED1_PINS);
 297  009e 4b10          	push	#16
 298  00a0 ae500a        	ldw	x,#20490
 299  00a3 cd0000        	call	_GPIO_ToggleBits
 301  00a6 84            	pop	a
 302                     ; 121     Delay(0x6FFF);
 304  00a7 ae6fff        	ldw	x,#28671
 305  00aa cd0000        	call	_Delay
 308  00ad 20cb          	jra	L76
 372                     	xdef	_main
 373                     	xdef	_Delay
 374                     	switch	.ubsct
 375  0000               _Index:
 376  0000 00            	ds.b	1
 377                     	xdef	_Index
 378                     	xdef	_AllowedRefresh
 379                     	xdef	_NonAlowedRefresh
 380                     	xref	_WWDG_GetCounter
 381                     	xref	_WWDG_SetCounter
 382                     	xref	_WWDG_Init
 383                     	xref	_RST_ClearFlag
 384                     	xref	_RST_GetFlagStatus
 385                     	xref	_GPIO_ToggleBits
 386                     	xref	_GPIO_Init
 387                     	xref	_EXTI_SetPinSensitivity
 388                     	xref	_EXTI_DeInit
 408                     	end
