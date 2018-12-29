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
 181                     ; 58 	_fctcpy('F');
 183  0016 a646          	ld	a,#70
 184  0018 cd0000        	call	__fctcpy
 186                     ; 59   GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_High_Slow);//初始化LED端口
 188  001b 4bd0          	push	#208
 189  001d 4b10          	push	#16
 190  001f ae500a        	ldw	x,#20490
 191  0022 cd0000        	call	_GPIO_Init
 193  0025 85            	popw	x
 194                     ; 60   GPIO_Init(KEY1_PORT,KEY1_PINS,GPIO_Mode_In_PU_No_IT);//初始化KEY端口，带上拉输入，不带中断
 196  0026 4b40          	push	#64
 197  0028 4b10          	push	#16
 198  002a ae500f        	ldw	x,#20495
 199  002d cd0000        	call	_GPIO_Init
 201  0030 85            	popw	x
 202                     ; 63   FLASH_DeInit();
 204  0031 cd0000        	call	_FLASH_DeInit
 206                     ; 64   FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);//标准编程时间
 208  0034 4f            	clr	a
 209  0035 cd0000        	call	_FLASH_SetProgrammingTime
 211                     ; 66   FLASH_Unlock(FLASH_MemType_Program);
 213  0038 a6fd          	ld	a,#253
 214  003a cd0000        	call	_FLASH_Unlock
 217  003d               L57:
 218                     ; 67   while (FLASH_GetFlagStatus(FLASH_FLAG_PUL) == RESET)//等待操作完成
 220  003d a602          	ld	a,#2
 221  003f cd0000        	call	_FLASH_GetFlagStatus
 223  0042 4d            	tnz	a
 224  0043 27f8          	jreq	L57
 225                     ; 71   for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 227  0045 0f0e          	clr	(OFST+0,sp)
 229  0047               L101:
 230                     ; 73     GBuffer[i] = newval;
 232  0047 7b0e          	ld	a,(OFST+0,sp)
 233  0049 5f            	clrw	x
 234  004a 97            	ld	xl,a
 235  004b 7b09          	ld	a,(OFST-5,sp)
 236  004d e700          	ld	(_GBuffer,x),a
 237                     ; 71   for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 239  004f 0c0e          	inc	(OFST+0,sp)
 243  0051 7b0e          	ld	a,(OFST+0,sp)
 244  0053 a180          	cp	a,#128
 245  0055 25f0          	jrult	L101
 246                     ; 78   FLASH_ProgramBlock(BLOCK_OPERATION,FLASH_MemType_Program, FLASH_ProgramMode_Standard, GBuffer);
 248  0057 ae0000        	ldw	x,#_GBuffer
 249  005a 89            	pushw	x
 250  005b 4b00          	push	#0
 251  005d 4bfd          	push	#253
 252  005f ae007d        	ldw	x,#125
 253  0062 cd0000        	call	_FLASH_ProgramBlock
 255  0065 5b04          	addw	sp,#4
 257  0067               L111:
 258                     ; 79  while (FLASH_GetFlagStatus(FLASH_FLAG_HVOFF) == RESET)
 260  0067 a640          	ld	a,#64
 261  0069 cd0000        	call	_FLASH_GetFlagStatus
 263  006c 4d            	tnz	a
 264  006d 27f8          	jreq	L111
 265                     ; 82   startadd = FLASH_PROGRAM_START_PHYSICAL_ADDRESS + ((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 267                     ; 83   stopadd = startadd + (uint16_t)FLASH_BLOCK_SIZE;
 269  006f aebf00        	ldw	x,#48896
 270  0072 1f07          	ldw	(OFST-7,sp),x
 271  0074 ae0000        	ldw	x,#0
 272  0077 1f05          	ldw	(OFST-9,sp),x
 274                     ; 84   for (add = startadd; add < stopadd; add++)
 276  0079 aebe80        	ldw	x,#48768
 277  007c 1f0c          	ldw	(OFST-2,sp),x
 278  007e ae0000        	ldw	x,#0
 279  0081 1f0a          	ldw	(OFST-4,sp),x
 282  0083 2023          	jra	L121
 283  0085               L511:
 284                     ; 86         if (FLASH_ReadByte(add) != newval)
 286  0085 1e0c          	ldw	x,(OFST-2,sp)
 287  0087 89            	pushw	x
 288  0088 1e0c          	ldw	x,(OFST-2,sp)
 289  008a 89            	pushw	x
 290  008b cd0000        	call	_FLASH_ReadByte
 292  008e 5b04          	addw	sp,#4
 293  0090 1109          	cp	a,(OFST-5,sp)
 294  0092 270b          	jreq	L521
 295                     ; 88           GPIO_SetBits(LED1_PORT, LED1_PINS);//如果有错误就熄灭LED
 297  0094 4b10          	push	#16
 298  0096 ae500a        	ldw	x,#20490
 299  0099 cd0000        	call	_GPIO_SetBits
 301  009c 84            	pop	a
 302  009d               L721:
 304  009d 20fe          	jra	L721
 305  009f               L521:
 306                     ; 84   for (add = startadd; add < stopadd; add++)
 308  009f 96            	ldw	x,sp
 309  00a0 1c000a        	addw	x,#OFST-4
 310  00a3 a601          	ld	a,#1
 311  00a5 cd0000        	call	c_lgadc
 314  00a8               L121:
 317  00a8 96            	ldw	x,sp
 318  00a9 1c000a        	addw	x,#OFST-4
 319  00ac cd0000        	call	c_ltor
 321  00af 96            	ldw	x,sp
 322  00b0 1c0005        	addw	x,#OFST-9
 323  00b3 cd0000        	call	c_lcmp
 325  00b6 25cd          	jrult	L511
 326  00b8               L331:
 327                     ; 100        GPIO_ToggleBits(LED1_PORT, LED1_PINS);
 329  00b8 4b10          	push	#16
 330  00ba ae500a        	ldw	x,#20490
 331  00bd cd0000        	call	_GPIO_ToggleBits
 333  00c0 84            	pop	a
 334                     ; 101        Delay(0xFFFF);
 336  00c1 aeffff        	ldw	x,#65535
 337  00c4 cd0000        	call	_Delay
 340  00c7 20ef          	jra	L331
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
