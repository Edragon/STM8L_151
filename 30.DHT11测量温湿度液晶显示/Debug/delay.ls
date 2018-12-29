   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  49                     ; 30 void delay_ms(u16 n_ms)
  49                     ; 31 {
  51                     	switch	.text
  52  0000               _delay_ms:
  54  0000 89            	pushw	x
  55       00000000      OFST:	set	0
  58                     ; 33   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
  60  0001 ae0001        	ldw	x,#1
  61  0004 a602          	ld	a,#2
  62  0006 95            	ld	xh,a
  63  0007 cd0000        	call	_CLK_PeripheralClockConfig
  65                     ; 35   TIM4_TimeBaseInit(TIM4_Prescaler_64,250);
  67  000a ae00fa        	ldw	x,#250
  68  000d a606          	ld	a,#6
  69  000f 95            	ld	xh,a
  70  0010 cd0000        	call	_TIM4_TimeBaseInit
  72                     ; 36   TIM4_SetCounter(0);
  74  0013 4f            	clr	a
  75  0014 cd0000        	call	_TIM4_SetCounter
  77                     ; 37   TIM4_ClearFlag(TIM4_FLAG_Update);
  79  0017 a601          	ld	a,#1
  80  0019 cd0000        	call	_TIM4_ClearFlag
  82                     ; 38   TIM4_Cmd(ENABLE);
  84  001c a601          	ld	a,#1
  85  001e cd0000        	call	_TIM4_Cmd
  88  0021 200d          	jra	L13
  89  0023               L73:
  90                     ; 41     while(TIM4_GetFlagStatus(TIM4_FLAG_Update) == 0) ;
  92  0023 a601          	ld	a,#1
  93  0025 cd0000        	call	_TIM4_GetFlagStatus
  95  0028 4d            	tnz	a
  96  0029 27f8          	jreq	L73
  97                     ; 42     TIM4_ClearFlag(TIM4_FLAG_Update);
  99  002b a601          	ld	a,#1
 100  002d cd0000        	call	_TIM4_ClearFlag
 102  0030               L13:
 103                     ; 39   while(n_ms--)
 105  0030 1e01          	ldw	x,(OFST+1,sp)
 106  0032 1d0001        	subw	x,#1
 107  0035 1f01          	ldw	(OFST+1,sp),x
 108  0037 1c0001        	addw	x,#1
 109  003a a30000        	cpw	x,#0
 110  003d 26e4          	jrne	L73
 111                     ; 44   TIM4_Cmd(DISABLE);
 113  003f 4f            	clr	a
 114  0040 cd0000        	call	_TIM4_Cmd
 116                     ; 45 }
 119  0043 85            	popw	x
 120  0044 81            	ret
 160                     ; 53 void delay_10us(u16 n_10us)
 160                     ; 54 {
 161                     	switch	.text
 162  0045               _delay_10us:
 164  0045 89            	pushw	x
 165       00000000      OFST:	set	0
 168                     ; 56   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 170  0046 ae0001        	ldw	x,#1
 171  0049 a602          	ld	a,#2
 172  004b 95            	ld	xh,a
 173  004c cd0000        	call	_CLK_PeripheralClockConfig
 175                     ; 58   TIM4_TimeBaseInit(TIM4_Prescaler_1,160);
 177  004f ae00a0        	ldw	x,#160
 178  0052 4f            	clr	a
 179  0053 95            	ld	xh,a
 180  0054 cd0000        	call	_TIM4_TimeBaseInit
 182                     ; 59   TIM4_SetCounter(0);
 184  0057 4f            	clr	a
 185  0058 cd0000        	call	_TIM4_SetCounter
 187                     ; 60   TIM4_ClearFlag(TIM4_FLAG_Update);
 189  005b a601          	ld	a,#1
 190  005d cd0000        	call	_TIM4_ClearFlag
 192                     ; 61   TIM4_Cmd(ENABLE);
 194  0060 a601          	ld	a,#1
 195  0062 cd0000        	call	_TIM4_Cmd
 198  0065 200d          	jra	L36
 199  0067               L17:
 200                     ; 64     while(TIM4_GetFlagStatus(TIM4_FLAG_Update) == 0) ;
 202  0067 a601          	ld	a,#1
 203  0069 cd0000        	call	_TIM4_GetFlagStatus
 205  006c 4d            	tnz	a
 206  006d 27f8          	jreq	L17
 207                     ; 65     TIM4_ClearFlag(TIM4_FLAG_Update);
 209  006f a601          	ld	a,#1
 210  0071 cd0000        	call	_TIM4_ClearFlag
 212  0074               L36:
 213                     ; 62   while(n_10us--)
 215  0074 1e01          	ldw	x,(OFST+1,sp)
 216  0076 1d0001        	subw	x,#1
 217  0079 1f01          	ldw	(OFST+1,sp),x
 218  007b 1c0001        	addw	x,#1
 219  007e a30000        	cpw	x,#0
 220  0081 26e4          	jrne	L17
 221                     ; 67   TIM4_Cmd(DISABLE);
 223  0083 4f            	clr	a
 224  0084 cd0000        	call	_TIM4_Cmd
 226                     ; 68  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
 228  0087 5f            	clrw	x
 229  0088 a602          	ld	a,#2
 230  008a 95            	ld	xh,a
 231  008b cd0000        	call	_CLK_PeripheralClockConfig
 233                     ; 70 }
 236  008e 85            	popw	x
 237  008f 81            	ret
 250                     	xdef	_delay_10us
 251                     	xdef	_delay_ms
 252                     	xref	_TIM4_ClearFlag
 253                     	xref	_TIM4_GetFlagStatus
 254                     	xref	_TIM4_Cmd
 255                     	xref	_TIM4_SetCounter
 256                     	xref	_TIM4_TimeBaseInit
 257                     	xref	_CLK_PeripheralClockConfig
 276                     	end
