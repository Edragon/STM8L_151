   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  48                     ; 13 unsigned char init_1820(void)  
  48                     ; 14 {  
  50                     	switch	.text
  51  0000               _init_1820:
  53  0000 88            	push	a
  54       00000001      OFST:	set	1
  57                     ; 15   unsigned char time=0;  
  59  0001 0f01          	clr	(OFST+0,sp)
  60                     ; 16     SET_DIR_1WIRE; //输出 
  62  0003 4be0          	push	#224
  63  0005 4b20          	push	#32
  64  0007 ae500f        	ldw	x,#20495
  65  000a cd0000        	call	_GPIO_Init
  67  000d 85            	popw	x
  68                     ; 17     SET_OP_1WIRE;//H   
  71  000e 4b20          	push	#32
  72  0010 ae500f        	ldw	x,#20495
  73  0013 cd0000        	call	_GPIO_SetBits
  75  0016 84            	pop	a
  76                     ; 18     CLR_OP_1WIRE;//L  
  78  0017 4b20          	push	#32
  79  0019 ae500f        	ldw	x,#20495
  80  001c cd0000        	call	_GPIO_ResetBits
  82  001f 84            	pop	a
  83                     ; 19     delay_10us(50);    //480us以上  
  85  0020 ae0032        	ldw	x,#50
  86  0023 cd0000        	call	_delay_10us
  88                     ; 20     SET_OP_1WIRE;//H  
  90  0026 4b20          	push	#32
  91  0028 ae500f        	ldw	x,#20495
  92  002b cd0000        	call	_GPIO_SetBits
  94  002e 84            	pop	a
  95                     ; 21     CLR_DIR_1WIRE;//输入  
  97  002f 4b00          	push	#0
  98  0031 4b20          	push	#32
  99  0033 ae500f        	ldw	x,#20495
 100  0036 cd0000        	call	_GPIO_Init
 102  0039 85            	popw	x
 103                     ; 22     delay_10us(6);     //15~60us  
 106  003a ae0006        	ldw	x,#6
 107  003d cd0000        	call	_delay_10us
 110  0040 200a          	jra	L13
 111  0042               L72:
 112                     ; 25       if(time==0XFE)
 114  0042 7b01          	ld	a,(OFST+0,sp)
 115  0044 a1fe          	cp	a,#254
 116  0046 2604          	jrne	L13
 117                     ; 26         return 0;
 119  0048 4f            	clr	a
 122  0049 5b01          	addw	sp,#1
 123  004b 81            	ret
 124  004c               L13:
 125                     ; 23     while(CHECK_IP_1WIRE&&time++)
 127  004c 4b20          	push	#32
 128  004e ae500f        	ldw	x,#20495
 129  0051 cd0000        	call	_GPIO_ReadInputDataBit
 131  0054 5b01          	addw	sp,#1
 132  0056 4d            	tnz	a
 133  0057 2707          	jreq	L73
 135  0059 7b01          	ld	a,(OFST+0,sp)
 136  005b 0c01          	inc	(OFST+0,sp)
 137  005d 4d            	tnz	a
 138  005e 26e2          	jrne	L72
 139  0060               L73:
 140                     ; 29     SET_DIR_1WIRE;  
 142  0060 4be0          	push	#224
 143  0062 4b20          	push	#32
 144  0064 ae500f        	ldw	x,#20495
 145  0067 cd0000        	call	_GPIO_Init
 147  006a 85            	popw	x
 148                     ; 30     SET_OP_1WIRE;  
 151  006b 4b20          	push	#32
 152  006d ae500f        	ldw	x,#20495
 153  0070 cd0000        	call	_GPIO_SetBits
 155  0073 84            	pop	a
 156                     ; 31     delay_10us(14);   //60~240us 
 158  0074 ae000e        	ldw	x,#14
 159  0077 cd0000        	call	_delay_10us
 161                     ; 32     return 1;
 163  007a a601          	ld	a,#1
 166  007c 5b01          	addw	sp,#1
 167  007e 81            	ret
 213                     ; 40 void write_1820(unsigned char x)  
 213                     ; 41 {     
 214                     	switch	.text
 215  007f               _write_1820:
 217  007f 88            	push	a
 218  0080 5203          	subw	sp,#3
 219       00000003      OFST:	set	3
 222                     ; 43     for(m=0;m<8;m++)  
 224  0082 0f03          	clr	(OFST+0,sp)
 225  0084               L36:
 226                     ; 45        CLR_OP_1WIRE;  
 228  0084 4b20          	push	#32
 229  0086 ae500f        	ldw	x,#20495
 230  0089 cd0000        	call	_GPIO_ResetBits
 232  008c 84            	pop	a
 233                     ; 46        if(x&(1<<m))    //写数据了，先写低位的！ 
 235  008d 7b04          	ld	a,(OFST+1,sp)
 236  008f 5f            	clrw	x
 237  0090 97            	ld	xl,a
 238  0091 1f01          	ldw	(OFST-2,sp),x
 239  0093 ae0001        	ldw	x,#1
 240  0096 7b03          	ld	a,(OFST+0,sp)
 241  0098 4d            	tnz	a
 242  0099 2704          	jreq	L01
 243  009b               L21:
 244  009b 58            	sllw	x
 245  009c 4a            	dec	a
 246  009d 26fc          	jrne	L21
 247  009f               L01:
 248  009f 01            	rrwa	x,a
 249  00a0 1402          	and	a,(OFST-1,sp)
 250  00a2 01            	rrwa	x,a
 251  00a3 1401          	and	a,(OFST-2,sp)
 252  00a5 01            	rrwa	x,a
 253  00a6 a30000        	cpw	x,#0
 254  00a9 270b          	jreq	L17
 255                     ; 47        SET_OP_1WIRE;  
 257  00ab 4b20          	push	#32
 258  00ad ae500f        	ldw	x,#20495
 259  00b0 cd0000        	call	_GPIO_SetBits
 261  00b3 84            	pop	a
 263  00b4 2009          	jra	L37
 264  00b6               L17:
 265                     ; 49        {CLR_OP_1WIRE;}  
 267  00b6 4b20          	push	#32
 268  00b8 ae500f        	ldw	x,#20495
 269  00bb cd0000        	call	_GPIO_ResetBits
 271  00be 84            	pop	a
 272  00bf               L37:
 273                     ; 50        delay_10us(4);   //15~60us  
 275  00bf ae0004        	ldw	x,#4
 276  00c2 cd0000        	call	_delay_10us
 278                     ; 51        SET_OP_1WIRE;  
 280  00c5 4b20          	push	#32
 281  00c7 ae500f        	ldw	x,#20495
 282  00ca cd0000        	call	_GPIO_SetBits
 284  00cd 84            	pop	a
 285                     ; 43     for(m=0;m<8;m++)  
 287  00ce 0c03          	inc	(OFST+0,sp)
 290  00d0 7b03          	ld	a,(OFST+0,sp)
 291  00d2 a108          	cp	a,#8
 292  00d4 25ae          	jrult	L36
 293                     ; 53      SET_OP_1WIRE;  
 295  00d6 4b20          	push	#32
 296  00d8 ae500f        	ldw	x,#20495
 297  00db cd0000        	call	_GPIO_SetBits
 299  00de 84            	pop	a
 300                     ; 54 } 
 303  00df 5b04          	addw	sp,#4
 304  00e1 81            	ret
 361                     ; 61 unsigned char read_1820(void)  
 361                     ; 62 {      
 362                     	switch	.text
 363  00e2               _read_1820:
 365  00e2 5203          	subw	sp,#3
 366       00000003      OFST:	set	3
 369                     ; 64     temp=0;  
 371  00e4 0f02          	clr	(OFST-1,sp)
 372                     ; 65     for(n=0;n<8;n++)  
 374  00e6 0f03          	clr	(OFST+0,sp)
 375  00e8               L321:
 376                     ; 67       CLR_OP_1WIRE;  
 378  00e8 4b20          	push	#32
 379  00ea ae500f        	ldw	x,#20495
 380  00ed cd0000        	call	_GPIO_ResetBits
 382  00f0 84            	pop	a
 383                     ; 68       SET_OP_1WIRE;  
 385  00f1 4b20          	push	#32
 386  00f3 ae500f        	ldw	x,#20495
 387  00f6 cd0000        	call	_GPIO_SetBits
 389  00f9 84            	pop	a
 390                     ; 69       CLR_DIR_1WIRE;  
 392  00fa 4b00          	push	#0
 393  00fc 4b20          	push	#32
 394  00fe ae500f        	ldw	x,#20495
 395  0101 cd0000        	call	_GPIO_Init
 397  0104 85            	popw	x
 398                     ; 70       k=(CHECK_IP_1WIRE);    //读数据,从低位开始  
 401  0105 4b20          	push	#32
 402  0107 ae500f        	ldw	x,#20495
 403  010a cd0000        	call	_GPIO_ReadInputDataBit
 405  010d 5b01          	addw	sp,#1
 406  010f 6b01          	ld	(OFST-2,sp),a
 407                     ; 71       if(k)  
 409  0111 0d01          	tnz	(OFST-2,sp)
 410  0113 2713          	jreq	L131
 411                     ; 72       temp|=(1<<n);  
 413  0115 7b03          	ld	a,(OFST+0,sp)
 414  0117 5f            	clrw	x
 415  0118 97            	ld	xl,a
 416  0119 a601          	ld	a,#1
 417  011b 5d            	tnzw	x
 418  011c 2704          	jreq	L61
 419  011e               L02:
 420  011e 48            	sll	a
 421  011f 5a            	decw	x
 422  0120 26fc          	jrne	L02
 423  0122               L61:
 424  0122 1a02          	or	a,(OFST-1,sp)
 425  0124 6b02          	ld	(OFST-1,sp),a
 427  0126 2012          	jra	L331
 428  0128               L131:
 429                     ; 74       temp&=~(1<<n);  
 431  0128 7b03          	ld	a,(OFST+0,sp)
 432  012a 5f            	clrw	x
 433  012b 97            	ld	xl,a
 434  012c a601          	ld	a,#1
 435  012e 5d            	tnzw	x
 436  012f 2704          	jreq	L22
 437  0131               L42:
 438  0131 48            	sll	a
 439  0132 5a            	decw	x
 440  0133 26fc          	jrne	L42
 441  0135               L22:
 442  0135 43            	cpl	a
 443  0136 1402          	and	a,(OFST-1,sp)
 444  0138 6b02          	ld	(OFST-1,sp),a
 445  013a               L331:
 446                     ; 75       delay_10us(10); //60~120us      
 448  013a ae000a        	ldw	x,#10
 449  013d cd0000        	call	_delay_10us
 451                     ; 76       SET_DIR_1WIRE;  
 453  0140 4be0          	push	#224
 454  0142 4b20          	push	#32
 455  0144 ae500f        	ldw	x,#20495
 456  0147 cd0000        	call	_GPIO_Init
 458  014a 85            	popw	x
 459                     ; 65     for(n=0;n<8;n++)  
 462  014b 0c03          	inc	(OFST+0,sp)
 465  014d 7b03          	ld	a,(OFST+0,sp)
 466  014f a108          	cp	a,#8
 467  0151 2595          	jrult	L321
 468                     ; 78    return (temp);  
 470  0153 7b02          	ld	a,(OFST-1,sp)
 473  0155 5b03          	addw	sp,#3
 474  0157 81            	ret
 530                     ; 86 unsigned int gettemp(void)    //读取温度值 
 530                     ; 87 {  
 531                     	switch	.text
 532  0158               _gettemp:
 534  0158 5204          	subw	sp,#4
 535       00000004      OFST:	set	4
 538                     ; 91      init_1820();        //复位18b20  
 540  015a cd0000        	call	_init_1820
 542                     ; 92      write_1820(0xcc);   // 发出转换命令  
 544  015d a6cc          	ld	a,#204
 545  015f cd007f        	call	_write_1820
 547                     ; 93      write_1820(0x44); 
 549  0162 a644          	ld	a,#68
 550  0164 cd007f        	call	_write_1820
 552                     ; 94     delay_ms(800);     //不延时也好使，不知道怎么回事！ 
 554  0167 ae0320        	ldw	x,#800
 555  016a cd0000        	call	_delay_ms
 557                     ; 95      init_1820();  
 559  016d cd0000        	call	_init_1820
 561                     ; 96      write_1820(0xcc);  //发出读命令  
 563  0170 a6cc          	ld	a,#204
 564  0172 cd007f        	call	_write_1820
 566                     ; 97      write_1820(0xbe);  
 568  0175 a6be          	ld	a,#190
 569  0177 cd007f        	call	_write_1820
 571                     ; 98      teml=read_1820();  //读数据  
 573  017a cd00e2        	call	_read_1820
 575  017d 6b02          	ld	(OFST-2,sp),a
 576                     ; 99      temh=read_1820();  
 578  017f cd00e2        	call	_read_1820
 580  0182 6b01          	ld	(OFST-3,sp),a
 581                     ; 100      temp=temh;
 583  0184 7b01          	ld	a,(OFST-3,sp)
 584  0186 5f            	clrw	x
 585  0187 97            	ld	xl,a
 586  0188 1f03          	ldw	(OFST-1,sp),x
 587                     ; 101     temp<<=8;
 589  018a 7b04          	ld	a,(OFST+0,sp)
 590  018c 6b03          	ld	(OFST-1,sp),a
 591  018e 0f04          	clr	(OFST+0,sp)
 592                     ; 102     temp|=teml;
 594  0190 7b02          	ld	a,(OFST-2,sp)
 595  0192 5f            	clrw	x
 596  0193 97            	ld	xl,a
 597  0194 01            	rrwa	x,a
 598  0195 1a04          	or	a,(OFST+0,sp)
 599  0197 01            	rrwa	x,a
 600  0198 1a03          	or	a,(OFST-1,sp)
 601  019a 01            	rrwa	x,a
 602  019b 1f03          	ldw	(OFST-1,sp),x
 603                     ; 103     temp*=6;
 605  019d 1e03          	ldw	x,(OFST-1,sp)
 606  019f 90ae0006      	ldw	y,#6
 607  01a3 cd0000        	call	c_imul
 609  01a6 1f03          	ldw	(OFST-1,sp),x
 610                     ; 105     return temp; 
 612  01a8 1e03          	ldw	x,(OFST-1,sp)
 615  01aa 5b04          	addw	sp,#4
 616  01ac 81            	ret
 629                     	xdef	_read_1820
 630                     	xdef	_write_1820
 631                     	xdef	_gettemp
 632                     	xdef	_init_1820
 633                     	xref	_delay_ms
 634                     	xref	_delay_10us
 635                     	xref	_GPIO_ReadInputDataBit
 636                     	xref	_GPIO_ResetBits
 637                     	xref	_GPIO_SetBits
 638                     	xref	_GPIO_Init
 657                     	xref	c_imul
 658                     	end
