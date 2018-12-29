   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	bsct
   5  0000               _DispTab:
   6  0000 eb            	dc.b	235
   7  0001 0a            	dc.b	10
   8  0002 ad            	dc.b	173
   9  0003 8f            	dc.b	143
  10  0004 4e            	dc.b	78
  11  0005 c7            	dc.b	199
  12  0006 e7            	dc.b	231
  13  0007 8a            	dc.b	138
  14  0008 ef            	dc.b	239
  15  0009 cf            	dc.b	207
  16  000a 85            	dc.b	133
  17  000b ee            	dc.b	238
  18  000c 67            	dc.b	103
  19  000d e1            	dc.b	225
  20  000e 2f            	dc.b	47
  21  000f e5            	dc.b	229
  22  0010 e4            	dc.b	228
  52                     ; 7 void Ht1621_CS_0(void) { GPIO_Init(Ht1621_CS_PORT, Ht1621_CS_PIN, GPIO_Mode_Out_PP_Low_Fast);}  // 
  54                     	switch	.text
  55  0000               _Ht1621_CS_0:
  61  0000 4be0          	push	#224
  62  0002 4b01          	push	#1
  63  0004 ae500f        	ldw	x,#20495
  64  0007 cd0000        	call	_GPIO_Init
  66  000a 85            	popw	x
  70  000b 81            	ret
  94                     ; 8 void Ht1621_CS_1(void) { GPIO_Init(Ht1621_CS_PORT, Ht1621_CS_PIN, GPIO_Mode_Out_PP_High_Fast);}
  95                     	switch	.text
  96  000c               _Ht1621_CS_1:
 102  000c 4bf0          	push	#240
 103  000e 4b01          	push	#1
 104  0010 ae500f        	ldw	x,#20495
 105  0013 cd0000        	call	_GPIO_Init
 107  0016 85            	popw	x
 111  0017 81            	ret
 135                     ; 10 void Ht1621_WR_0(void) { GPIO_Init(Ht1621_WR_PORT, Ht1621_WR_PIN, GPIO_Mode_Out_PP_Low_Fast);}  // 
 136                     	switch	.text
 137  0018               _Ht1621_WR_0:
 143  0018 4be0          	push	#224
 144  001a 4b02          	push	#2
 145  001c ae500f        	ldw	x,#20495
 146  001f cd0000        	call	_GPIO_Init
 148  0022 85            	popw	x
 152  0023 81            	ret
 176                     ; 11 void Ht1621_WR_1(void) { GPIO_Init(Ht1621_WR_PORT, Ht1621_WR_PIN, GPIO_Mode_Out_PP_High_Fast);}
 177                     	switch	.text
 178  0024               _Ht1621_WR_1:
 184  0024 4bf0          	push	#240
 185  0026 4b02          	push	#2
 186  0028 ae500f        	ldw	x,#20495
 187  002b cd0000        	call	_GPIO_Init
 189  002e 85            	popw	x
 193  002f 81            	ret
 217                     ; 13 void Ht1621_DAT_0(void) { GPIO_Init(Ht1621_DAT_PORT, Ht1621_DAT_PIN, GPIO_Mode_Out_PP_Low_Fast);}  // 
 218                     	switch	.text
 219  0030               _Ht1621_DAT_0:
 225  0030 4be0          	push	#224
 226  0032 4b04          	push	#4
 227  0034 ae500f        	ldw	x,#20495
 228  0037 cd0000        	call	_GPIO_Init
 230  003a 85            	popw	x
 234  003b 81            	ret
 258                     ; 14 void Ht1621_DAT_1(void) { GPIO_Init(Ht1621_DAT_PORT, Ht1621_DAT_PIN, GPIO_Mode_Out_PP_High_Fast);}
 259                     	switch	.text
 260  003c               _Ht1621_DAT_1:
 266  003c 4bf0          	push	#240
 267  003e 4b04          	push	#4
 268  0040 ae500f        	ldw	x,#20495
 269  0043 cd0000        	call	_GPIO_Init
 271  0046 85            	popw	x
 275  0047 81            	ret
 299                     ; 16 void Ht1621_GND_0(void) { GPIO_Init(Ht1621_GND_PORT, Ht1621_GND_PIN, GPIO_Mode_Out_PP_Low_Slow);}  //
 300                     	switch	.text
 301  0048               _Ht1621_GND_0:
 307  0048 4bc0          	push	#192
 308  004a 4b08          	push	#8
 309  004c ae500f        	ldw	x,#20495
 310  004f cd0000        	call	_GPIO_Init
 312  0052 85            	popw	x
 316  0053 81            	ret
 340                     ; 17 void Ht1621_GND_1(void) { GPIO_Init(Ht1621_GND_PORT, Ht1621_GND_PIN, GPIO_Mode_Out_PP_High_Fast);}
 341                     	switch	.text
 342  0054               _Ht1621_GND_1:
 348  0054 4bf0          	push	#240
 349  0056 4b08          	push	#8
 350  0058 ae500f        	ldw	x,#20495
 351  005b cd0000        	call	_GPIO_Init
 353  005e 85            	popw	x
 357  005f 81            	ret
 381                     ; 19 void Ht1621_VCC_0(void) { GPIO_Init(Ht1621_VCC_PORT, Ht1621_VCC_PIN, GPIO_Mode_Out_PP_Low_Fast);}  //
 382                     	switch	.text
 383  0060               _Ht1621_VCC_0:
 389  0060 4be0          	push	#224
 390  0062 4b01          	push	#1
 391  0064 ae5005        	ldw	x,#20485
 392  0067 cd0000        	call	_GPIO_Init
 394  006a 85            	popw	x
 398  006b 81            	ret
 422                     ; 20 void Ht1621_VCC_1(void) { GPIO_Init(Ht1621_VCC_PORT, Ht1621_VCC_PIN, GPIO_Mode_Out_PP_High_Slow);}
 423                     	switch	.text
 424  006c               _Ht1621_VCC_1:
 430  006c 4bd0          	push	#208
 431  006e 4b01          	push	#1
 432  0070 ae5005        	ldw	x,#20485
 433  0073 cd0000        	call	_GPIO_Init
 435  0076 85            	popw	x
 439  0077 81            	ret
 495                     ; 31 void Ht1621Wr_Data(unsigned char Data,unsigned char cnt) 
 495                     ; 32 { 
 496                     	switch	.text
 497  0078               _Ht1621Wr_Data:
 499  0078 89            	pushw	x
 500  0079 88            	push	a
 501       00000001      OFST:	set	1
 504                     ; 34   for (i=0;i<cnt;i++) 
 506  007a 0f01          	clr	(OFST+0,sp)
 508  007c 2016          	jra	L361
 509  007e               L751:
 510                     ; 36      Ht1621_WR_0(); 
 512  007e ad98          	call	_Ht1621_WR_0
 514                     ; 37      if((Data & 0x80)==0x80) 
 516  0080 7b02          	ld	a,(OFST+1,sp)
 517  0082 a480          	and	a,#128
 518  0084 a180          	cp	a,#128
 519  0086 2604          	jrne	L761
 520                     ; 38         {Ht1621_DAT_1();}
 522  0088 adb2          	call	_Ht1621_DAT_1
 525  008a 2002          	jra	L171
 526  008c               L761:
 527                     ; 40         {Ht1621_DAT_0();}
 529  008c ada2          	call	_Ht1621_DAT_0
 531  008e               L171:
 532                     ; 41      Ht1621_WR_1(); 
 534  008e ad94          	call	_Ht1621_WR_1
 536                     ; 42      Data<<=1; 
 538  0090 0802          	sll	(OFST+1,sp)
 539                     ; 34   for (i=0;i<cnt;i++) 
 541  0092 0c01          	inc	(OFST+0,sp)
 542  0094               L361:
 545  0094 7b01          	ld	a,(OFST+0,sp)
 546  0096 1103          	cp	a,(OFST+2,sp)
 547  0098 25e4          	jrult	L751
 548                     ; 44 } 
 551  009a 5b03          	addw	sp,#3
 552  009c 81            	ret
 589                     ; 54 void Ht1621WrCmd(unsigned char Cmd) 
 589                     ; 55 { 
 590                     	switch	.text
 591  009d               _Ht1621WrCmd:
 593  009d 88            	push	a
 594       00000000      OFST:	set	0
 597                     ; 56    Ht1621_CS_0(); 
 599  009e cd0000        	call	_Ht1621_CS_0
 601                     ; 57    Ht1621Wr_Data(0x80,4);          //写入命令标志100 
 603  00a1 ae0004        	ldw	x,#4
 604  00a4 a680          	ld	a,#128
 605  00a6 95            	ld	xh,a
 606  00a7 adcf          	call	_Ht1621Wr_Data
 608                     ; 58    Ht1621Wr_Data(Cmd,8);           //写入命令数据 
 610  00a9 ae0008        	ldw	x,#8
 611  00ac 7b01          	ld	a,(OFST+1,sp)
 612  00ae 95            	ld	xh,a
 613  00af adc7          	call	_Ht1621Wr_Data
 615                     ; 59    Ht1621_CS_1(); 
 617  00b1 cd000c        	call	_Ht1621_CS_1
 619                     ; 60 } 
 622  00b4 84            	pop	a
 623  00b5 81            	ret
 669                     ; 70 void Ht1621WrOneData(unsigned char Addr,unsigned char Data)
 669                     ; 71 {
 670                     	switch	.text
 671  00b6               _Ht1621WrOneData:
 673  00b6 89            	pushw	x
 674       00000000      OFST:	set	0
 677                     ; 72   Ht1621_CS_0();
 679  00b7 cd0000        	call	_Ht1621_CS_0
 681                     ; 73   Ht1621Wr_Data(0xa0,3);  //写入数据标志101
 683  00ba ae0003        	ldw	x,#3
 684  00bd a6a0          	ld	a,#160
 685  00bf 95            	ld	xh,a
 686  00c0 adb6          	call	_Ht1621Wr_Data
 688                     ; 74   Ht1621Wr_Data(Addr<<2,6); //写入地址数据
 690  00c2 ae0006        	ldw	x,#6
 691  00c5 7b01          	ld	a,(OFST+1,sp)
 692  00c7 48            	sll	a
 693  00c8 48            	sll	a
 694  00c9 95            	ld	xh,a
 695  00ca adac          	call	_Ht1621Wr_Data
 697                     ; 75   Ht1621Wr_Data(Data,4); //写入数据的前四位 7  6  5  4
 699  00cc ae0004        	ldw	x,#4
 700  00cf 7b02          	ld	a,(OFST+2,sp)
 701  00d1 95            	ld	xh,a
 702  00d2 ada4          	call	_Ht1621Wr_Data
 704                     ; 76   Ht1621_CS_1();
 706  00d4 cd000c        	call	_Ht1621_CS_1
 708                     ; 77 }
 711  00d7 85            	popw	x
 712  00d8 81            	ret
 777                     ; 87 void Ht1621WrAllData(unsigned char Addr,unsigned char *p,unsigned char cnt)
 777                     ; 88 {
 778                     	switch	.text
 779  00d9               _Ht1621WrAllData:
 781  00d9 88            	push	a
 782  00da 88            	push	a
 783       00000001      OFST:	set	1
 786                     ; 90   Ht1621_CS_0();
 788  00db cd0000        	call	_Ht1621_CS_0
 790                     ; 91   Ht1621Wr_Data(0xa0,3); //写入数据标志101
 792  00de ae0003        	ldw	x,#3
 793  00e1 a6a0          	ld	a,#160
 794  00e3 95            	ld	xh,a
 795  00e4 ad92          	call	_Ht1621Wr_Data
 797                     ; 92   Ht1621Wr_Data(Addr<<2,6); //写入地址数据
 799  00e6 ae0006        	ldw	x,#6
 800  00e9 7b02          	ld	a,(OFST+1,sp)
 801  00eb 48            	sll	a
 802  00ec 48            	sll	a
 803  00ed 95            	ld	xh,a
 804  00ee ad88          	call	_Ht1621Wr_Data
 806                     ; 93   for (i=0;i<cnt;i++)
 808  00f0 0f01          	clr	(OFST+0,sp)
 810  00f2 2014          	jra	L172
 811  00f4               L562:
 812                     ; 95     Ht1621Wr_Data(*p,8); //写入数据
 814  00f4 ae0008        	ldw	x,#8
 815  00f7 1605          	ldw	y,(OFST+4,sp)
 816  00f9 90f6          	ld	a,(y)
 817  00fb 95            	ld	xh,a
 818  00fc cd0078        	call	_Ht1621Wr_Data
 820                     ; 96     p++;
 822  00ff 1e05          	ldw	x,(OFST+4,sp)
 823  0101 1c0001        	addw	x,#1
 824  0104 1f05          	ldw	(OFST+4,sp),x
 825                     ; 93   for (i=0;i<cnt;i++)
 827  0106 0c01          	inc	(OFST+0,sp)
 828  0108               L172:
 831  0108 7b01          	ld	a,(OFST+0,sp)
 832  010a 1107          	cp	a,(OFST+6,sp)
 833  010c 25e6          	jrult	L562
 834                     ; 98   Ht1621_CS_1();
 836  010e cd000c        	call	_Ht1621_CS_1
 838                     ; 99 }
 841  0111 85            	popw	x
 842  0112 81            	ret
 868                     ; 109 void Ht1621_Init(void) 
 868                     ; 110 { 
 869                     	switch	.text
 870  0113               _Ht1621_Init:
 874                     ; 111     Ht1621_GND_0();       //HT1621 power on
 876  0113 cd0048        	call	_Ht1621_GND_0
 878                     ; 112     Ht1621_VCC_1();
 880  0116 cd006c        	call	_Ht1621_VCC_1
 882                     ; 113    Ht1621WrCmd(BIAS); 
 884  0119 a652          	ld	a,#82
 885  011b ad80          	call	_Ht1621WrCmd
 887                     ; 114    Ht1621WrCmd(RC256);             //使用内部振荡器 
 889  011d a630          	ld	a,#48
 890  011f cd009d        	call	_Ht1621WrCmd
 892                     ; 116    Ht1621WrCmd(SYSDIS); 
 894  0122 4f            	clr	a
 895  0123 cd009d        	call	_Ht1621WrCmd
 897                     ; 117    Ht1621WrCmd(WDTDIS1); 
 899  0126 a60a          	ld	a,#10
 900  0128 cd009d        	call	_Ht1621WrCmd
 902                     ; 118    Ht1621WrCmd(SYSEN); 
 904  012b a602          	ld	a,#2
 905  012d cd009d        	call	_Ht1621WrCmd
 907                     ; 119    Ht1621WrCmd(LCDON); 
 909  0130 a606          	ld	a,#6
 910  0132 cd009d        	call	_Ht1621WrCmd
 912                     ; 120 } 
 915  0135 81            	ret
 944                     ; 130 void Display(void) 
 944                     ; 131 { 
 945                     	switch	.text
 946  0136               _Display:
 950                     ; 133    Ht1621WrOneData(0 , DispTab[n4]);
 952  0136 be00          	ldw	x,_n4
 953  0138 e600          	ld	a,(_DispTab,x)
 954  013a 97            	ld	xl,a
 955  013b 4f            	clr	a
 956  013c 95            	ld	xh,a
 957  013d cd00b6        	call	_Ht1621WrOneData
 959                     ; 134    Ht1621WrOneData(1 , DispTab[n4]<<4);
 961  0140 be00          	ldw	x,_n4
 962  0142 e600          	ld	a,(_DispTab,x)
 963  0144 97            	ld	xl,a
 964  0145 a610          	ld	a,#16
 965  0147 42            	mul	x,a
 966  0148 9f            	ld	a,xl
 967  0149 97            	ld	xl,a
 968  014a a601          	ld	a,#1
 969  014c 95            	ld	xh,a
 970  014d cd00b6        	call	_Ht1621WrOneData
 972                     ; 136    Ht1621WrOneData(2 , DispTab[n3]);
 974  0150 be02          	ldw	x,_n3
 975  0152 e600          	ld	a,(_DispTab,x)
 976  0154 97            	ld	xl,a
 977  0155 a602          	ld	a,#2
 978  0157 95            	ld	xh,a
 979  0158 cd00b6        	call	_Ht1621WrOneData
 981                     ; 137    Ht1621WrOneData(3 , DispTab[n3]<<4);
 983  015b be02          	ldw	x,_n3
 984  015d e600          	ld	a,(_DispTab,x)
 985  015f 97            	ld	xl,a
 986  0160 a610          	ld	a,#16
 987  0162 42            	mul	x,a
 988  0163 9f            	ld	a,xl
 989  0164 97            	ld	xl,a
 990  0165 a603          	ld	a,#3
 991  0167 95            	ld	xh,a
 992  0168 cd00b6        	call	_Ht1621WrOneData
 994                     ; 139    Ht1621WrOneData(4 , DispTab[n2]);
 996  016b be04          	ldw	x,_n2
 997  016d e600          	ld	a,(_DispTab,x)
 998  016f 97            	ld	xl,a
 999  0170 a604          	ld	a,#4
1000  0172 95            	ld	xh,a
1001  0173 cd00b6        	call	_Ht1621WrOneData
1003                     ; 140    Ht1621WrOneData(5 , DispTab[n2]<<4);
1005  0176 be04          	ldw	x,_n2
1006  0178 e600          	ld	a,(_DispTab,x)
1007  017a 97            	ld	xl,a
1008  017b a610          	ld	a,#16
1009  017d 42            	mul	x,a
1010  017e 9f            	ld	a,xl
1011  017f 97            	ld	xl,a
1012  0180 a605          	ld	a,#5
1013  0182 95            	ld	xh,a
1014  0183 cd00b6        	call	_Ht1621WrOneData
1016                     ; 142    Ht1621WrOneData(6 , DispTab[n1]); 
1018  0186 be06          	ldw	x,_n1
1019  0188 e600          	ld	a,(_DispTab,x)
1020  018a 97            	ld	xl,a
1021  018b a606          	ld	a,#6
1022  018d 95            	ld	xh,a
1023  018e cd00b6        	call	_Ht1621WrOneData
1025                     ; 143    Ht1621WrOneData(7 , DispTab[n1]<<4); 
1027  0191 be06          	ldw	x,_n1
1028  0193 e600          	ld	a,(_DispTab,x)
1029  0195 97            	ld	xl,a
1030  0196 a610          	ld	a,#16
1031  0198 42            	mul	x,a
1032  0199 9f            	ld	a,xl
1033  019a 97            	ld	xl,a
1034  019b a607          	ld	a,#7
1035  019d 95            	ld	xh,a
1036  019e cd00b6        	call	_Ht1621WrOneData
1038                     ; 145 }
1041  01a1 81            	ret
1067                     ; 155 void Display_lcd_dot(void) 
1067                     ; 156 { 
1068                     	switch	.text
1069  01a2               _Display_lcd_dot:
1073                     ; 158    Ht1621WrOneData(2 , DispTab[n3]|0x10);    //2P
1075  01a2 be02          	ldw	x,_n3
1076  01a4 e600          	ld	a,(_DispTab,x)
1077  01a6 aa10          	or	a,#16
1078  01a8 97            	ld	xl,a
1079  01a9 a602          	ld	a,#2
1080  01ab 95            	ld	xh,a
1081  01ac cd00b6        	call	_Ht1621WrOneData
1083                     ; 161 }
1086  01af 81            	ret
1125                     ; 171 void data_convertor(unsigned long adc_value) 
1125                     ; 172 {  
1126                     	switch	.text
1127  01b0               _data_convertor:
1129       00000000      OFST:	set	0
1132                     ; 173     tmp=adc_value;         //adc 
1134  01b0 1e05          	ldw	x,(OFST+5,sp)
1135  01b2 bf08          	ldw	_tmp,x
1136                     ; 174     n4=tmp/1000;
1138  01b4 be08          	ldw	x,_tmp
1139  01b6 90ae03e8      	ldw	y,#1000
1140  01ba 65            	divw	x,y
1141  01bb bf00          	ldw	_n4,x
1142                     ; 175     tmp=tmp%1000;
1144  01bd be08          	ldw	x,_tmp
1145  01bf 90ae03e8      	ldw	y,#1000
1146  01c3 65            	divw	x,y
1147  01c4 51            	exgw	x,y
1148  01c5 bf08          	ldw	_tmp,x
1149                     ; 176     n3=tmp/100;
1151  01c7 be08          	ldw	x,_tmp
1152  01c9 a664          	ld	a,#100
1153  01cb 62            	div	x,a
1154  01cc bf02          	ldw	_n3,x
1155                     ; 177     tmp=tmp%100;	
1157  01ce be08          	ldw	x,_tmp
1158  01d0 a664          	ld	a,#100
1159  01d2 62            	div	x,a
1160  01d3 5f            	clrw	x
1161  01d4 97            	ld	xl,a
1162  01d5 bf08          	ldw	_tmp,x
1163                     ; 178     n2=tmp/10;
1165  01d7 be08          	ldw	x,_tmp
1166  01d9 a60a          	ld	a,#10
1167  01db 62            	div	x,a
1168  01dc bf04          	ldw	_n2,x
1169                     ; 179     tmp=tmp%10;		
1171  01de be08          	ldw	x,_tmp
1172  01e0 a60a          	ld	a,#10
1173  01e2 62            	div	x,a
1174  01e3 5f            	clrw	x
1175  01e4 97            	ld	xl,a
1176  01e5 bf08          	ldw	_tmp,x
1177                     ; 180     n1=tmp; 
1179  01e7 be08          	ldw	x,_tmp
1180  01e9 bf06          	ldw	_n1,x
1181                     ; 181  }
1184  01eb 81            	ret
1254                     	xdef	_Ht1621_VCC_1
1255                     	xdef	_Ht1621_VCC_0
1256                     	xdef	_Ht1621_GND_1
1257                     	xdef	_Ht1621_GND_0
1258                     	xdef	_Ht1621_DAT_1
1259                     	xdef	_Ht1621_DAT_0
1260                     	xdef	_Ht1621_WR_1
1261                     	xdef	_Ht1621_WR_0
1262                     	xdef	_Ht1621_CS_1
1263                     	xdef	_Ht1621_CS_0
1264                     	xdef	_DispTab
1265                     	switch	.ubsct
1266  0000               _n4:
1267  0000 0000          	ds.b	2
1268                     	xdef	_n4
1269  0002               _n3:
1270  0002 0000          	ds.b	2
1271                     	xdef	_n3
1272  0004               _n2:
1273  0004 0000          	ds.b	2
1274                     	xdef	_n2
1275  0006               _n1:
1276  0006 0000          	ds.b	2
1277                     	xdef	_n1
1278  0008               _tmp:
1279  0008 0000          	ds.b	2
1280                     	xdef	_tmp
1281                     	xdef	_data_convertor
1282                     	xdef	_Display_lcd_dot
1283                     	xdef	_Display
1284                     	xdef	_Ht1621_Init
1285                     	xdef	_Ht1621WrAllData
1286                     	xdef	_Ht1621WrOneData
1287                     	xdef	_Ht1621WrCmd
1288                     	xdef	_Ht1621Wr_Data
1289                     	xref	_GPIO_Init
1309                     	end
