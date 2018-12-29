   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  53                     ; 25 void Delay(__IO uint16_t nCount)
  53                     ; 26 {
  55                     	switch	.text
  56  0000               _Delay:
  58  0000 89            	pushw	x
  59       00000000      OFST:	set	0
  62  0001 2007          	jra	L13
  63  0003               L72:
  64                     ; 30         nCount--;
  66  0003 1e01          	ldw	x,(OFST+1,sp)
  67  0005 1d0001        	subw	x,#1
  68  0008 1f01          	ldw	(OFST+1,sp),x
  69  000a               L13:
  70                     ; 28     while (nCount != 0)
  72  000a 1e01          	ldw	x,(OFST+1,sp)
  73  000c 26f5          	jrne	L72
  74                     ; 32 }
  77  000e 85            	popw	x
  78  000f 81            	ret
 109                     ; 43 int main( void )
 109                     ; 44 {
 110                     	switch	.text
 111  0010               _main:
 115                     ; 45 	GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);//初始化LED端口
 117  0010 4bc0          	push	#192
 118  0012 4b10          	push	#16
 119  0014 ae500a        	ldw	x,#20490
 120  0017 cd0000        	call	_GPIO_Init
 122  001a 85            	popw	x
 123                     ; 46   GPIO_SetBits (LED1_PORT,LED1_PINS);
 125  001b 4b10          	push	#16
 126  001d ae500a        	ldw	x,#20490
 127  0020 cd0000        	call	_GPIO_SetBits
 129  0023 84            	pop	a
 130                     ; 49   PWR_DeInit();//初始化
 132  0024 cd0000        	call	_PWR_DeInit
 134                     ; 50   PWR_PVDLevelConfig (PWR_PVDLevel_3V05);//阈值为3.05V
 136  0027 a60c          	ld	a,#12
 137  0029 cd0000        	call	_PWR_PVDLevelConfig
 139                     ; 51   PWR_PVDCmd(ENABLE);//PVD使能
 141  002c a601          	ld	a,#1
 142  002e cd0000        	call	_PWR_PVDCmd
 144  0031               L54:
 145                     ; 59        if(PWR_GetFlagStatus(PWR_FLAG_PVDOF)==RESET)//读取PVD状态，如果VDD电压高于阈值，则熄灭LED
 147  0031 a640          	ld	a,#64
 148  0033 cd0000        	call	_PWR_GetFlagStatus
 150  0036 4d            	tnz	a
 151  0037 2610          	jrne	L15
 152                     ; 61          GPIO_SetBits (LED1_PORT,LED1_PINS);
 154  0039 4b10          	push	#16
 155  003b ae500a        	ldw	x,#20490
 156  003e cd0000        	call	_GPIO_SetBits
 158  0041 84            	pop	a
 159                     ; 62          Delay(0xffff);
 161  0042 aeffff        	ldw	x,#65535
 162  0045 adb9          	call	_Delay
 165  0047 20e8          	jra	L54
 166  0049               L15:
 167                     ; 66          GPIO_ResetBits (LED1_PORT,LED1_PINS);
 169  0049 4b10          	push	#16
 170  004b ae500a        	ldw	x,#20490
 171  004e cd0000        	call	_GPIO_ResetBits
 173  0051 84            	pop	a
 174                     ; 67          Delay(0xffff);
 176  0052 aeffff        	ldw	x,#65535
 177  0055 ada9          	call	_Delay
 179  0057 20d8          	jra	L54
 192                     	xdef	_main
 193                     	xdef	_Delay
 194                     	xref	_PWR_GetFlagStatus
 195                     	xref	_PWR_PVDCmd
 196                     	xref	_PWR_PVDLevelConfig
 197                     	xref	_PWR_DeInit
 198                     	xref	_GPIO_ResetBits
 199                     	xref	_GPIO_SetBits
 200                     	xref	_GPIO_Init
 219                     	end
