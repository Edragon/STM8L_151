   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  58                     ; 13 unsigned char init_1820(void)  
  58                     ; 14 {  
  60                     	switch	.text
  61  0000               _init_1820:
  63  0000 88            	push	a
  64       00000001      OFST:	set	1
  67                     ; 15   unsigned char time=0;  
  69  0001 0f01          	clr	(OFST+0,sp)
  71                     ; 16     SET_DIR_1WIRE; //输出 
  73  0003 4be0          	push	#224
  74  0005 4b10          	push	#16
  75  0007 ae500f        	ldw	x,#20495
  76  000a cd0000        	call	_GPIO_Init
  78  000d 85            	popw	x
  79                     ; 17     SET_OP_1WIRE;//H   
  82  000e 4b10          	push	#16
  83  0010 ae500f        	ldw	x,#20495
  84  0013 cd0000        	call	_GPIO_SetBits
  86  0016 84            	pop	a
  87                     ; 18     CLR_OP_1WIRE;//L  
  89  0017 4b10          	push	#16
  90  0019 ae500f        	ldw	x,#20495
  91  001c cd0000        	call	_GPIO_ResetBits
  93  001f 84            	pop	a
  94                     ; 19     delay_10us(50);    //480us以上  
  96  0020 ae0032        	ldw	x,#50
  97  0023 cd0000        	call	_delay_10us
  99                     ; 20     SET_OP_1WIRE;//H  
 101  0026 4b10          	push	#16
 102  0028 ae500f        	ldw	x,#20495
 103  002b cd0000        	call	_GPIO_SetBits
 105  002e 84            	pop	a
 106                     ; 21     CLR_DIR_1WIRE;//输入  
 108  002f 4b00          	push	#0
 109  0031 4b10          	push	#16
 110  0033 ae500f        	ldw	x,#20495
 111  0036 cd0000        	call	_GPIO_Init
 113  0039 85            	popw	x
 114                     ; 22     delay_10us(6);     //15~60us  
 117  003a ae0006        	ldw	x,#6
 118  003d cd0000        	call	_delay_10us
 121  0040 200a          	jra	L13
 122  0042               L72:
 123                     ; 25       if(time==0XFE)
 125  0042 7b01          	ld	a,(OFST+0,sp)
 126  0044 a1fe          	cp	a,#254
 127  0046 2604          	jrne	L13
 128                     ; 26         return 0;
 130  0048 4f            	clr	a
 133  0049 5b01          	addw	sp,#1
 134  004b 81            	ret
 135  004c               L13:
 136                     ; 23     while(CHECK_IP_1WIRE&&time++)
 138  004c 4b10          	push	#16
 139  004e ae500f        	ldw	x,#20495
 140  0051 cd0000        	call	_GPIO_ReadInputDataBit
 142  0054 5b01          	addw	sp,#1
 143  0056 4d            	tnz	a
 144  0057 2707          	jreq	L73
 146  0059 7b01          	ld	a,(OFST+0,sp)
 147  005b 0c01          	inc	(OFST+0,sp)
 149  005d 4d            	tnz	a
 150  005e 26e2          	jrne	L72
 151  0060               L73:
 152                     ; 29     SET_DIR_1WIRE;  
 154  0060 4be0          	push	#224
 155  0062 4b10          	push	#16
 156  0064 ae500f        	ldw	x,#20495
 157  0067 cd0000        	call	_GPIO_Init
 159  006a 85            	popw	x
 160                     ; 30     SET_OP_1WIRE;  
 163  006b 4b10          	push	#16
 164  006d ae500f        	ldw	x,#20495
 165  0070 cd0000        	call	_GPIO_SetBits
 167  0073 84            	pop	a
 168                     ; 31     delay_10us(14);   //60~240us 
 170  0074 ae000e        	ldw	x,#14
 171  0077 cd0000        	call	_delay_10us
 173                     ; 32     return 1;
 175  007a a601          	ld	a,#1
 178  007c 5b01          	addw	sp,#1
 179  007e 81            	ret
 225                     ; 40 void write_1820(unsigned char x)  
 225                     ; 41 {     
 226                     	switch	.text
 227  007f               _write_1820:
 229  007f 88            	push	a
 230  0080 5203          	subw	sp,#3
 231       00000003      OFST:	set	3
 234                     ; 43     for(m=0;m<8;m++)  
 236  0082 0f03          	clr	(OFST+0,sp)
 238  0084               L36:
 239                     ; 45        CLR_OP_1WIRE;  
 241  0084 4b10          	push	#16
 242  0086 ae500f        	ldw	x,#20495
 243  0089 cd0000        	call	_GPIO_ResetBits
 245  008c 84            	pop	a
 246                     ; 46        if(x&(1<<m))    //写数据了，先写低位的！ 
 248  008d 7b04          	ld	a,(OFST+1,sp)
 249  008f 5f            	clrw	x
 250  0090 97            	ld	xl,a
 251  0091 1f01          	ldw	(OFST-2,sp),x
 253  0093 ae0001        	ldw	x,#1
 254  0096 7b03          	ld	a,(OFST+0,sp)
 255  0098 4d            	tnz	a
 256  0099 2704          	jreq	L01
 257  009b               L21:
 258  009b 58            	sllw	x
 259  009c 4a            	dec	a
 260  009d 26fc          	jrne	L21
 261  009f               L01:
 262  009f 01            	rrwa	x,a
 263  00a0 1402          	and	a,(OFST-1,sp)
 264  00a2 01            	rrwa	x,a
 265  00a3 1401          	and	a,(OFST-2,sp)
 266  00a5 01            	rrwa	x,a
 267  00a6 a30000        	cpw	x,#0
 268  00a9 270b          	jreq	L17
 269                     ; 47        SET_OP_1WIRE;  
 271  00ab 4b10          	push	#16
 272  00ad ae500f        	ldw	x,#20495
 273  00b0 cd0000        	call	_GPIO_SetBits
 275  00b3 84            	pop	a
 277  00b4 2009          	jra	L37
 278  00b6               L17:
 279                     ; 49        {CLR_OP_1WIRE;}  
 281  00b6 4b10          	push	#16
 282  00b8 ae500f        	ldw	x,#20495
 283  00bb cd0000        	call	_GPIO_ResetBits
 285  00be 84            	pop	a
 286  00bf               L37:
 287                     ; 50        delay_10us(4);   //15~60us  
 289  00bf ae0004        	ldw	x,#4
 290  00c2 cd0000        	call	_delay_10us
 292                     ; 51        SET_OP_1WIRE;  
 294  00c5 4b10          	push	#16
 295  00c7 ae500f        	ldw	x,#20495
 296  00ca cd0000        	call	_GPIO_SetBits
 298  00cd 84            	pop	a
 299                     ; 43     for(m=0;m<8;m++)  
 301  00ce 0c03          	inc	(OFST+0,sp)
 305  00d0 7b03          	ld	a,(OFST+0,sp)
 306  00d2 a108          	cp	a,#8
 307  00d4 25ae          	jrult	L36
 308                     ; 53      SET_OP_1WIRE;  
 310  00d6 4b10          	push	#16
 311  00d8 ae500f        	ldw	x,#20495
 312  00db cd0000        	call	_GPIO_SetBits
 314  00de 84            	pop	a
 315                     ; 54 } 
 318  00df 5b04          	addw	sp,#4
 319  00e1 81            	ret
 376                     ; 61 unsigned char read_1820(void)  
 376                     ; 62 {      
 377                     	switch	.text
 378  00e2               _read_1820:
 380  00e2 5203          	subw	sp,#3
 381       00000003      OFST:	set	3
 384                     ; 64     temp=0;  
 386  00e4 0f02          	clr	(OFST-1,sp)
 388                     ; 65     for(n=0;n<8;n++)  
 390  00e6 0f03          	clr	(OFST+0,sp)
 392  00e8               L321:
 393                     ; 67       CLR_OP_1WIRE;  
 395  00e8 4b10          	push	#16
 396  00ea ae500f        	ldw	x,#20495
 397  00ed cd0000        	call	_GPIO_ResetBits
 399  00f0 84            	pop	a
 400                     ; 68       SET_OP_1WIRE;  
 402  00f1 4b10          	push	#16
 403  00f3 ae500f        	ldw	x,#20495
 404  00f6 cd0000        	call	_GPIO_SetBits
 406  00f9 84            	pop	a
 407                     ; 69       CLR_DIR_1WIRE;  
 409  00fa 4b00          	push	#0
 410  00fc 4b10          	push	#16
 411  00fe ae500f        	ldw	x,#20495
 412  0101 cd0000        	call	_GPIO_Init
 414  0104 85            	popw	x
 415                     ; 70       k=(CHECK_IP_1WIRE);    //读数据,从低位开始  
 418  0105 4b10          	push	#16
 419  0107 ae500f        	ldw	x,#20495
 420  010a cd0000        	call	_GPIO_ReadInputDataBit
 422  010d 5b01          	addw	sp,#1
 423  010f 6b01          	ld	(OFST-2,sp),a
 425                     ; 71       if(k)  
 427  0111 0d01          	tnz	(OFST-2,sp)
 428  0113 2713          	jreq	L131
 429                     ; 72       temp|=(1<<n);  
 431  0115 7b03          	ld	a,(OFST+0,sp)
 432  0117 5f            	clrw	x
 433  0118 97            	ld	xl,a
 434  0119 a601          	ld	a,#1
 435  011b 5d            	tnzw	x
 436  011c 2704          	jreq	L61
 437  011e               L02:
 438  011e 48            	sll	a
 439  011f 5a            	decw	x
 440  0120 26fc          	jrne	L02
 441  0122               L61:
 442  0122 1a02          	or	a,(OFST-1,sp)
 443  0124 6b02          	ld	(OFST-1,sp),a
 446  0126 2012          	jra	L331
 447  0128               L131:
 448                     ; 74       temp&=~(1<<n);  
 450  0128 7b03          	ld	a,(OFST+0,sp)
 451  012a 5f            	clrw	x
 452  012b 97            	ld	xl,a
 453  012c a601          	ld	a,#1
 454  012e 5d            	tnzw	x
 455  012f 2704          	jreq	L22
 456  0131               L42:
 457  0131 48            	sll	a
 458  0132 5a            	decw	x
 459  0133 26fc          	jrne	L42
 460  0135               L22:
 461  0135 43            	cpl	a
 462  0136 1402          	and	a,(OFST-1,sp)
 463  0138 6b02          	ld	(OFST-1,sp),a
 465  013a               L331:
 466                     ; 75       delay_10us(10); //60~120us      
 468  013a ae000a        	ldw	x,#10
 469  013d cd0000        	call	_delay_10us
 471                     ; 76       SET_DIR_1WIRE;  
 473  0140 4be0          	push	#224
 474  0142 4b10          	push	#16
 475  0144 ae500f        	ldw	x,#20495
 476  0147 cd0000        	call	_GPIO_Init
 478  014a 85            	popw	x
 479                     ; 65     for(n=0;n<8;n++)  
 482  014b 0c03          	inc	(OFST+0,sp)
 486  014d 7b03          	ld	a,(OFST+0,sp)
 487  014f a108          	cp	a,#8
 488  0151 2595          	jrult	L321
 489                     ; 78    return (temp);  
 491  0153 7b02          	ld	a,(OFST-1,sp)
 494  0155 5b03          	addw	sp,#3
 495  0157 81            	ret
 551                     ; 86 unsigned int gettemp(void)    //读取温度值 
 551                     ; 87 {  
 552                     	switch	.text
 553  0158               _gettemp:
 555  0158 5204          	subw	sp,#4
 556       00000004      OFST:	set	4
 559                     ; 91      init_1820();        //复位18b20  
 561  015a cd0000        	call	_init_1820
 563                     ; 92      write_1820(0xcc);   // 发出转换命令  
 565  015d a6cc          	ld	a,#204
 566  015f cd007f        	call	_write_1820
 568                     ; 93      write_1820(0x44); 
 570  0162 a644          	ld	a,#68
 571  0164 cd007f        	call	_write_1820
 573                     ; 94     delay_ms(800);     //不延时也好使，不知道怎么回事！ 
 575  0167 ae0320        	ldw	x,#800
 576  016a cd0000        	call	_delay_ms
 578                     ; 95      init_1820();  
 580  016d cd0000        	call	_init_1820
 582                     ; 96      write_1820(0xcc);  //发出读命令  
 584  0170 a6cc          	ld	a,#204
 585  0172 cd007f        	call	_write_1820
 587                     ; 97      write_1820(0xbe);  
 589  0175 a6be          	ld	a,#190
 590  0177 cd007f        	call	_write_1820
 592                     ; 98      teml=read_1820();  //读数据  
 594  017a cd00e2        	call	_read_1820
 596  017d 6b02          	ld	(OFST-2,sp),a
 598                     ; 99      temh=read_1820();  
 600  017f cd00e2        	call	_read_1820
 602  0182 6b01          	ld	(OFST-3,sp),a
 604                     ; 100      temp=temh;
 606  0184 7b01          	ld	a,(OFST-3,sp)
 607  0186 5f            	clrw	x
 608  0187 97            	ld	xl,a
 609  0188 1f03          	ldw	(OFST-1,sp),x
 611                     ; 101     temp<<=8;
 613  018a 7b04          	ld	a,(OFST+0,sp)
 614  018c 6b03          	ld	(OFST-1,sp),a
 615  018e 0f04          	clr	(OFST+0,sp)
 617                     ; 102     temp|=teml;
 619  0190 7b02          	ld	a,(OFST-2,sp)
 620  0192 5f            	clrw	x
 621  0193 97            	ld	xl,a
 622  0194 01            	rrwa	x,a
 623  0195 1a04          	or	a,(OFST+0,sp)
 624  0197 01            	rrwa	x,a
 625  0198 1a03          	or	a,(OFST-1,sp)
 626  019a 01            	rrwa	x,a
 627  019b 1f03          	ldw	(OFST-1,sp),x
 629                     ; 103     temp*=6;
 631  019d 1e03          	ldw	x,(OFST-1,sp)
 632  019f 90ae0006      	ldw	y,#6
 633  01a3 cd0000        	call	c_imul
 635  01a6 1f03          	ldw	(OFST-1,sp),x
 637                     ; 105     return temp; 
 639  01a8 1e03          	ldw	x,(OFST-1,sp)
 642  01aa 5b04          	addw	sp,#4
 643  01ac 81            	ret
 656                     	xdef	_read_1820
 657                     	xdef	_write_1820
 658                     	xdef	_gettemp
 659                     	xdef	_init_1820
 660                     	xref	_delay_ms
 661                     	xref	_delay_10us
 662                     	xref	_GPIO_ReadInputDataBit
 663                     	xref	_GPIO_ResetBits
 664                     	xref	_GPIO_SetBits
 665                     	xref	_GPIO_Init
 666                     	xref.b	c_x
 685                     	xref	c_imul
 686                     	end
