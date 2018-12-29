   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  14                     	bsct
  15  0000               _val:
  16  0000 00            	dc.b	0
  56                     ; 27 void Delay(__IO uint16_t nCount)
  56                     ; 28 {
  58                     	switch	.text
  59  0000               _Delay:
  61  0000 89            	pushw	x
  62       00000000      OFST:	set	0
  65  0001 2007          	jra	L13
  66  0003               L72:
  67                     ; 32         nCount--;
  69  0003 1e01          	ldw	x,(OFST+1,sp)
  70  0005 1d0001        	subw	x,#1
  71  0008 1f01          	ldw	(OFST+1,sp),x
  72  000a               L13:
  73                     ; 30     while (nCount != 0)
  75  000a 1e01          	ldw	x,(OFST+1,sp)
  76  000c 26f5          	jrne	L72
  77                     ; 34 }
  80  000e 85            	popw	x
  81  000f 81            	ret
 153                     ; 47 void main(void)
 153                     ; 48 {
 154                     	switch	.text
 155  0010               _main:
 157  0010 520d          	subw	sp,#13
 158       0000000d      OFST:	set	13
 161                     ; 49 	uint32_t start_add = 0x1000;
 163  0012 ae1000        	ldw	x,#4096
 164  0015 1f03          	ldw	(OFST-10,sp),x
 165  0017 ae0000        	ldw	x,#0
 166  001a 1f01          	ldw	(OFST-12,sp),x
 168                     ; 50   uint32_t add = 0x00;
 170                     ; 51   uint32_t new_val = 0x01234567;
 172  001c ae4567        	ldw	x,#17767
 173  001f 1f07          	ldw	(OFST-6,sp),x
 174  0021 ae0123        	ldw	x,#291
 175  0024 1f05          	ldw	(OFST-8,sp),x
 177                     ; 52   uint8_t sub_test_count = 0x00;
 179                     ; 53   GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);//初始化LED端口
 181  0026 4bc0          	push	#192
 182  0028 4b10          	push	#16
 183  002a ae500a        	ldw	x,#20490
 184  002d cd0000        	call	_GPIO_Init
 186  0030 85            	popw	x
 187                     ; 54   GPIO_Init(KEY1_PORT,KEY1_PINS,GPIO_Mode_In_PU_No_IT);//初始化KEY端口，带上拉输入，不带中断
 189  0031 4b40          	push	#64
 190  0033 4b10          	push	#16
 191  0035 ae500f        	ldw	x,#20495
 192  0038 cd0000        	call	_GPIO_Init
 194  003b 85            	popw	x
 195                     ; 57   FLASH_DeInit();
 197  003c cd0000        	call	_FLASH_DeInit
 199                     ; 58   FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);//标准编程时间
 201  003f 4f            	clr	a
 202  0040 cd0000        	call	_FLASH_SetProgrammingTime
 204                     ; 59   FLASH_Unlock(FLASH_MemType_Data);//先解锁FLASH区域，注意参数
 206  0043 a6f7          	ld	a,#247
 207  0045 cd0000        	call	_FLASH_Unlock
 209                     ; 61   FLASH_ProgramWord(start_add, new_val);
 211  0048 1e07          	ldw	x,(OFST-6,sp)
 212  004a 89            	pushw	x
 213  004b 1e07          	ldw	x,(OFST-6,sp)
 214  004d 89            	pushw	x
 215  004e 1e07          	ldw	x,(OFST-6,sp)
 216  0050 89            	pushw	x
 217  0051 1e07          	ldw	x,(OFST-6,sp)
 218  0053 89            	pushw	x
 219  0054 cd0000        	call	_FLASH_ProgramWord
 221  0057 5b08          	addw	sp,#8
 222                     ; 62   val = FLASH_ReadByte(start_add);
 224  0059 1e03          	ldw	x,(OFST-10,sp)
 225  005b 89            	pushw	x
 226  005c 1e03          	ldw	x,(OFST-10,sp)
 227  005e 89            	pushw	x
 228  005f cd0000        	call	_FLASH_ReadByte
 230  0062 5b04          	addw	sp,#4
 231  0064 b700          	ld	_val,a
 232                     ; 63   add = start_add;
 234  0066 1e03          	ldw	x,(OFST-10,sp)
 235  0068 1f0c          	ldw	(OFST-1,sp),x
 236  006a 1e01          	ldw	x,(OFST-12,sp)
 237  006c 1f0a          	ldw	(OFST-3,sp),x
 239                     ; 65   if (val != BYTE_3(new_val))
 241  006e b600          	ld	a,_val
 242  0070 1105          	cp	a,(OFST-8,sp)
 243  0072 270b          	jreq	L76
 244                     ; 67         GPIO_SetBits(LED1_PORT, LED1_PINS);//如果有错误就熄灭LED
 246  0074 4b10          	push	#16
 247  0076 ae500a        	ldw	x,#20490
 248  0079 cd0000        	call	_GPIO_SetBits
 250  007c 84            	pop	a
 251  007d               L17:
 253  007d 20fe          	jra	L17
 254  007f               L76:
 255                     ; 73     add += 1;
 257  007f 96            	ldw	x,sp
 258  0080 1c000a        	addw	x,#OFST-3
 259  0083 a601          	ld	a,#1
 260  0085 cd0000        	call	c_lgadc
 263                     ; 74     val = FLASH_ReadByte(add);
 265  0088 1e0c          	ldw	x,(OFST-1,sp)
 266  008a 89            	pushw	x
 267  008b 1e0c          	ldw	x,(OFST-1,sp)
 268  008d 89            	pushw	x
 269  008e cd0000        	call	_FLASH_ReadByte
 271  0091 5b04          	addw	sp,#4
 272  0093 b700          	ld	_val,a
 273                     ; 75     if (val != BYTE_2(new_val))
 275  0095 7b06          	ld	a,(OFST-7,sp)
 276  0097 a4ff          	and	a,#255
 277  0099 b100          	cp	a,_val
 278  009b 270b          	jreq	L57
 279                     ; 77         GPIO_SetBits(LED1_PORT, LED1_PINS);//如果有错误就熄灭LED
 281  009d 4b10          	push	#16
 282  009f ae500a        	ldw	x,#20490
 283  00a2 cd0000        	call	_GPIO_SetBits
 285  00a5 84            	pop	a
 286  00a6               L77:
 288  00a6 20fe          	jra	L77
 289  00a8               L57:
 290                     ; 83     add += 1;
 292  00a8 96            	ldw	x,sp
 293  00a9 1c000a        	addw	x,#OFST-3
 294  00ac a601          	ld	a,#1
 295  00ae cd0000        	call	c_lgadc
 298                     ; 84     val = FLASH_ReadByte(add);
 300  00b1 1e0c          	ldw	x,(OFST-1,sp)
 301  00b3 89            	pushw	x
 302  00b4 1e0c          	ldw	x,(OFST-1,sp)
 303  00b6 89            	pushw	x
 304  00b7 cd0000        	call	_FLASH_ReadByte
 306  00ba 5b04          	addw	sp,#4
 307  00bc b700          	ld	_val,a
 308                     ; 85     if (val != BYTE_1(new_val))
 310  00be 7b07          	ld	a,(OFST-6,sp)
 311  00c0 a4ff          	and	a,#255
 312  00c2 b100          	cp	a,_val
 313  00c4 270b          	jreq	L301
 314                     ; 87         GPIO_SetBits(LED1_PORT, LED1_PINS);//如果有错误就熄灭LED
 316  00c6 4b10          	push	#16
 317  00c8 ae500a        	ldw	x,#20490
 318  00cb cd0000        	call	_GPIO_SetBits
 320  00ce 84            	pop	a
 321  00cf               L501:
 323  00cf 20fe          	jra	L501
 324  00d1               L301:
 325                     ; 94     add += 1;
 327  00d1 96            	ldw	x,sp
 328  00d2 1c000a        	addw	x,#OFST-3
 329  00d5 a601          	ld	a,#1
 330  00d7 cd0000        	call	c_lgadc
 333                     ; 95     val = FLASH_ReadByte(add);
 335  00da 1e0c          	ldw	x,(OFST-1,sp)
 336  00dc 89            	pushw	x
 337  00dd 1e0c          	ldw	x,(OFST-1,sp)
 338  00df 89            	pushw	x
 339  00e0 cd0000        	call	_FLASH_ReadByte
 341  00e3 5b04          	addw	sp,#4
 342  00e5 b700          	ld	_val,a
 343                     ; 96     if (val != BYTE_0(new_val))
 345  00e7 7b08          	ld	a,(OFST-5,sp)
 346  00e9 a4ff          	and	a,#255
 347  00eb b100          	cp	a,_val
 348  00ed 270b          	jreq	L111
 349                     ; 98         GPIO_SetBits(LED1_PORT, LED1_PINS);//如果有错误就熄灭LED
 351  00ef 4b10          	push	#16
 352  00f1 ae500a        	ldw	x,#20490
 353  00f4 cd0000        	call	_GPIO_SetBits
 355  00f7 84            	pop	a
 356  00f8               L311:
 358  00f8 20fe          	jra	L311
 359  00fa               L111:
 360                     ; 104     add = start_add;
 362  00fa 1e03          	ldw	x,(OFST-10,sp)
 363  00fc 1f0c          	ldw	(OFST-1,sp),x
 364  00fe 1e01          	ldw	x,(OFST-12,sp)
 365  0100 1f0a          	ldw	(OFST-3,sp),x
 367                     ; 105     for (sub_test_count = 0; sub_test_count < 4; sub_test_count++)
 369  0102 0f09          	clr	(OFST-4,sp)
 371  0104               L711:
 372                     ; 107         FLASH_EraseByte(add);
 374  0104 1e0c          	ldw	x,(OFST-1,sp)
 375  0106 89            	pushw	x
 376  0107 1e0c          	ldw	x,(OFST-1,sp)
 377  0109 89            	pushw	x
 378  010a cd0000        	call	_FLASH_EraseByte
 380  010d 5b04          	addw	sp,#4
 381                     ; 108         add += 1;
 383  010f 96            	ldw	x,sp
 384  0110 1c000a        	addw	x,#OFST-3
 385  0113 a601          	ld	a,#1
 386  0115 cd0000        	call	c_lgadc
 389                     ; 105     for (sub_test_count = 0; sub_test_count < 4; sub_test_count++)
 391  0118 0c09          	inc	(OFST-4,sp)
 395  011a 7b09          	ld	a,(OFST-4,sp)
 396  011c a104          	cp	a,#4
 397  011e 25e4          	jrult	L711
 398                     ; 111     add = start_add;
 400  0120 1e03          	ldw	x,(OFST-10,sp)
 401  0122 1f0c          	ldw	(OFST-1,sp),x
 402  0124 1e01          	ldw	x,(OFST-12,sp)
 403  0126 1f0a          	ldw	(OFST-3,sp),x
 405                     ; 112     for (sub_test_count = 0; sub_test_count < 4; sub_test_count++)
 407  0128 0f09          	clr	(OFST-4,sp)
 409  012a               L521:
 410                     ; 114         val = FLASH_ReadByte(add);
 412  012a 1e0c          	ldw	x,(OFST-1,sp)
 413  012c 89            	pushw	x
 414  012d 1e0c          	ldw	x,(OFST-1,sp)
 415  012f 89            	pushw	x
 416  0130 cd0000        	call	_FLASH_ReadByte
 418  0133 5b04          	addw	sp,#4
 419  0135 b700          	ld	_val,a
 420                     ; 115         if (val != 0x00)
 422  0137 3d00          	tnz	_val
 423  0139 270b          	jreq	L331
 424                     ; 117             GPIO_SetBits(LED1_PORT, LED1_PINS);//如果有错误就熄灭LED
 426  013b 4b10          	push	#16
 427  013d ae500a        	ldw	x,#20490
 428  0140 cd0000        	call	_GPIO_SetBits
 430  0143 84            	pop	a
 431  0144               L531:
 433  0144 20fe          	jra	L531
 434  0146               L331:
 435                     ; 122         add += 1;
 437  0146 96            	ldw	x,sp
 438  0147 1c000a        	addw	x,#OFST-3
 439  014a a601          	ld	a,#1
 440  014c cd0000        	call	c_lgadc
 443                     ; 112     for (sub_test_count = 0; sub_test_count < 4; sub_test_count++)
 445  014f 0c09          	inc	(OFST-4,sp)
 449  0151 7b09          	ld	a,(OFST-4,sp)
 450  0153 a104          	cp	a,#4
 451  0155 25d3          	jrult	L521
 452  0157               L141:
 453                     ; 126        GPIO_ToggleBits(LED1_PORT, LED1_PINS);
 455  0157 4b10          	push	#16
 456  0159 ae500a        	ldw	x,#20490
 457  015c cd0000        	call	_GPIO_ToggleBits
 459  015f 84            	pop	a
 460                     ; 127        Delay(0xFFFF);
 462  0160 aeffff        	ldw	x,#65535
 463  0163 cd0000        	call	_Delay
 466  0166 20ef          	jra	L141
 490                     	xdef	_main
 491                     	xdef	_Delay
 492                     	xdef	_val
 493                     	xref	_GPIO_ToggleBits
 494                     	xref	_GPIO_SetBits
 495                     	xref	_GPIO_Init
 496                     	xref	_FLASH_ReadByte
 497                     	xref	_FLASH_ProgramWord
 498                     	xref	_FLASH_EraseByte
 499                     	xref	_FLASH_Unlock
 500                     	xref	_FLASH_DeInit
 501                     	xref	_FLASH_SetProgrammingTime
 520                     	xref	c_lgadc
 521                     	end
