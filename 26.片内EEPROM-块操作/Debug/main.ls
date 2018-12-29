   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  53                     ; 30 void Delay(__IO uint16_t nCount)
  53                     ; 31 {
  55                     	switch	.text
  56  0000               _Delay:
  58  0000 89            	pushw	x
  59       00000000      OFST:	set	0
  62  0001 2007          	jra	L13
  63  0003               L72:
  64                     ; 35         nCount--;
  66  0003 1e01          	ldw	x,(OFST+1,sp)
  67  0005 1d0001        	subw	x,#1
  68  0008 1f01          	ldw	(OFST+1,sp),x
  69  000a               L13:
  70                     ; 33     while (nCount != 0)
  72  000a 1e01          	ldw	x,(OFST+1,sp)
  73  000c 26f5          	jrne	L72
  74                     ; 37 }
  77  000e 85            	popw	x
  78  000f 81            	ret
 160                     ; 52 void main(void)
 160                     ; 53 {
 161                     	switch	.text
 162  0010               _main:
 164  0010 520e          	subw	sp,#14
 165       0000000e      OFST:	set	14
 168                     ; 54 	uint32_t add = 0, startadd = 0, stopadd = 0;
 174                     ; 55   uint8_t newval = 0xAA;
 176  0012 a6aa          	ld	a,#170
 177  0014 6b09          	ld	(OFST-5,sp),a
 179                     ; 56   uint8_t i = 0;
 181                     ; 59   GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_High_Slow);//初始化LED端口
 183  0016 4bd0          	push	#208
 184  0018 4b10          	push	#16
 185  001a ae500a        	ldw	x,#20490
 186  001d cd0000        	call	_GPIO_Init
 188  0020 85            	popw	x
 189                     ; 60   GPIO_Init(KEY1_PORT,KEY1_PINS,GPIO_Mode_In_PU_No_IT);//初始化KEY端口，带上拉输入，不带中断
 191  0021 4b40          	push	#64
 192  0023 4b10          	push	#16
 193  0025 ae500f        	ldw	x,#20495
 194  0028 cd0000        	call	_GPIO_Init
 196  002b 85            	popw	x
 197                     ; 62   _fctcpy('F');
 199  002c a646          	ld	a,#70
 200  002e cd0000        	call	__fctcpy
 202                     ; 63   FLASH_DeInit();
 204  0031 cd0000        	call	_FLASH_DeInit
 206                     ; 64   FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);//标准编程时间
 208  0034 4f            	clr	a
 209  0035 cd0000        	call	_FLASH_SetProgrammingTime
 211                     ; 67   FLASH_Unlock(FLASH_MemType_Data);
 213  0038 a6f7          	ld	a,#247
 214  003a cd0000        	call	_FLASH_Unlock
 217  003d               L57:
 218                     ; 68   while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)//等待操作完成
 220  003d a608          	ld	a,#8
 221  003f cd0000        	call	_FLASH_GetFlagStatus
 223  0042 4d            	tnz	a
 224  0043 27f8          	jreq	L57
 225                     ; 72   for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 227  0045 0f0e          	clr	(OFST+0,sp)
 229  0047               L101:
 230                     ; 74     GBuffer[i] = newval;
 232  0047 7b0e          	ld	a,(OFST+0,sp)
 233  0049 5f            	clrw	x
 234  004a 97            	ld	xl,a
 235  004b 7b09          	ld	a,(OFST-5,sp)
 236  004d e700          	ld	(_GBuffer,x),a
 237                     ; 72   for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 239  004f 0c0e          	inc	(OFST+0,sp)
 243  0051 7b0e          	ld	a,(OFST+0,sp)
 244  0053 a180          	cp	a,#128
 245  0055 25f0          	jrult	L101
 246                     ; 77   FLASH_ProgramBlock(BLOCK_OPERATION,FLASH_MemType_Data, FLASH_ProgramMode_Standard, GBuffer);
 248  0057 ae0000        	ldw	x,#_GBuffer
 249  005a 89            	pushw	x
 250  005b 4b00          	push	#0
 251  005d 4bf7          	push	#247
 252  005f 5f            	clrw	x
 253  0060 cd0000        	call	_FLASH_ProgramBlock
 255  0063 5b04          	addw	sp,#4
 257  0065               L111:
 258                     ; 78  while (FLASH_GetFlagStatus(FLASH_FLAG_HVOFF) == RESET)
 260  0065 a640          	ld	a,#64
 261  0067 cd0000        	call	_FLASH_GetFlagStatus
 263  006a 4d            	tnz	a
 264  006b 27f8          	jreq	L111
 265                     ; 81   startadd = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS + ((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 267                     ; 82   stopadd = startadd + (uint16_t)FLASH_BLOCK_SIZE;
 269  006d ae1080        	ldw	x,#4224
 270  0070 1f07          	ldw	(OFST-7,sp),x
 271  0072 ae0000        	ldw	x,#0
 272  0075 1f05          	ldw	(OFST-9,sp),x
 274                     ; 83   for (add = startadd; add < stopadd; add++)
 276  0077 ae1000        	ldw	x,#4096
 277  007a 1f0c          	ldw	(OFST-2,sp),x
 278  007c ae0000        	ldw	x,#0
 279  007f 1f0a          	ldw	(OFST-4,sp),x
 282  0081 2023          	jra	L121
 283  0083               L511:
 284                     ; 85         if (FLASH_ReadByte(add) != newval)
 286  0083 1e0c          	ldw	x,(OFST-2,sp)
 287  0085 89            	pushw	x
 288  0086 1e0c          	ldw	x,(OFST-2,sp)
 289  0088 89            	pushw	x
 290  0089 cd0000        	call	_FLASH_ReadByte
 292  008c 5b04          	addw	sp,#4
 293  008e 1109          	cp	a,(OFST-5,sp)
 294  0090 270b          	jreq	L521
 295                     ; 87           GPIO_SetBits(LED1_PORT, LED1_PINS);//如果有错误就熄灭LED
 297  0092 4b10          	push	#16
 298  0094 ae500a        	ldw	x,#20490
 299  0097 cd0000        	call	_GPIO_SetBits
 301  009a 84            	pop	a
 302  009b               L721:
 304  009b 20fe          	jra	L721
 305  009d               L521:
 306                     ; 83   for (add = startadd; add < stopadd; add++)
 308  009d 96            	ldw	x,sp
 309  009e 1c000a        	addw	x,#OFST-4
 310  00a1 a601          	ld	a,#1
 311  00a3 cd0000        	call	c_lgadc
 314  00a6               L121:
 317  00a6 96            	ldw	x,sp
 318  00a7 1c000a        	addw	x,#OFST-4
 319  00aa cd0000        	call	c_ltor
 321  00ad 96            	ldw	x,sp
 322  00ae 1c0005        	addw	x,#OFST-9
 323  00b1 cd0000        	call	c_lcmp
 325  00b4 25cd          	jrult	L511
 326  00b6               L331:
 327                     ; 99        GPIO_ToggleBits(LED1_PORT, LED1_PINS);
 329  00b6 4b10          	push	#16
 330  00b8 ae500a        	ldw	x,#20490
 331  00bb cd0000        	call	_GPIO_ToggleBits
 333  00be 84            	pop	a
 334                     ; 100        Delay(0xFFFF);
 336  00bf aeffff        	ldw	x,#65535
 337  00c2 cd0000        	call	_Delay
 340  00c5 20ef          	jra	L331
 365                     	xdef	_main
 366                     	xdef	_Delay
 367                     	switch	.ubsct
 368  0000               _GBuffer:
 369  0000 000000000000  	ds.b	128
 370                     	xdef	_GBuffer
 371                     	xref	__fctcpy
 372                     	xref	_GPIO_ToggleBits
 373                     	xref	_GPIO_SetBits
 374                     	xref	_GPIO_Init
 375                     	xref	_FLASH_ProgramBlock
 376                     	xref	_FLASH_GetFlagStatus
 377                     	xref	_FLASH_ReadByte
 378                     	xref	_FLASH_Unlock
 379                     	xref	_FLASH_DeInit
 380                     	xref	_FLASH_SetProgrammingTime
 400                     	xref	c_lcmp
 401                     	xref	c_ltor
 402                     	xref	c_lgadc
 403                     	end
