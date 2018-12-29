   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  14                     	bsct
  15  0000               _DispTab:
  16  0000 eb            	dc.b	235
  17  0001 0a            	dc.b	10
  18  0002 ad            	dc.b	173
  19  0003 8f            	dc.b	143
  20  0004 4e            	dc.b	78
  21  0005 c7            	dc.b	199
  22  0006 e7            	dc.b	231
  23  0007 8a            	dc.b	138
  24  0008 ef            	dc.b	239
  25  0009 cf            	dc.b	207
  26  000a 85            	dc.b	133
  27  000b ee            	dc.b	238
  28  000c 67            	dc.b	103
  29  000d e1            	dc.b	225
  30  000e 2f            	dc.b	47
  31  000f e5            	dc.b	229
  32  0010 e4            	dc.b	228
  62                     ; 7 void Ht1621_CS_0(void) { GPIO_Init(Ht1621_CS_PORT, Ht1621_CS_PIN, GPIO_Mode_Out_PP_Low_Fast);}  // 
  64                     	switch	.text
  65  0000               _Ht1621_CS_0:
  71  0000 4be0          	push	#224
  72  0002 4b01          	push	#1
  73  0004 ae500f        	ldw	x,#20495
  74  0007 cd0000        	call	_GPIO_Init
  76  000a 85            	popw	x
  80  000b 81            	ret
 104                     ; 8 void Ht1621_CS_1(void) { GPIO_Init(Ht1621_CS_PORT, Ht1621_CS_PIN, GPIO_Mode_Out_PP_High_Fast);}
 105                     	switch	.text
 106  000c               _Ht1621_CS_1:
 112  000c 4bf0          	push	#240
 113  000e 4b01          	push	#1
 114  0010 ae500f        	ldw	x,#20495
 115  0013 cd0000        	call	_GPIO_Init
 117  0016 85            	popw	x
 121  0017 81            	ret
 145                     ; 10 void Ht1621_WR_0(void) { GPIO_Init(Ht1621_WR_PORT, Ht1621_WR_PIN, GPIO_Mode_Out_PP_Low_Fast);}  // 
 146                     	switch	.text
 147  0018               _Ht1621_WR_0:
 153  0018 4be0          	push	#224
 154  001a 4b02          	push	#2
 155  001c ae500f        	ldw	x,#20495
 156  001f cd0000        	call	_GPIO_Init
 158  0022 85            	popw	x
 162  0023 81            	ret
 186                     ; 11 void Ht1621_WR_1(void) { GPIO_Init(Ht1621_WR_PORT, Ht1621_WR_PIN, GPIO_Mode_Out_PP_High_Fast);}
 187                     	switch	.text
 188  0024               _Ht1621_WR_1:
 194  0024 4bf0          	push	#240
 195  0026 4b02          	push	#2
 196  0028 ae500f        	ldw	x,#20495
 197  002b cd0000        	call	_GPIO_Init
 199  002e 85            	popw	x
 203  002f 81            	ret
 227                     ; 13 void Ht1621_DAT_0(void) { GPIO_Init(Ht1621_DAT_PORT, Ht1621_DAT_PIN, GPIO_Mode_Out_PP_Low_Fast);}  // 
 228                     	switch	.text
 229  0030               _Ht1621_DAT_0:
 235  0030 4be0          	push	#224
 236  0032 4b04          	push	#4
 237  0034 ae500f        	ldw	x,#20495
 238  0037 cd0000        	call	_GPIO_Init
 240  003a 85            	popw	x
 244  003b 81            	ret
 268                     ; 14 void Ht1621_DAT_1(void) { GPIO_Init(Ht1621_DAT_PORT, Ht1621_DAT_PIN, GPIO_Mode_Out_PP_High_Fast);}
 269                     	switch	.text
 270  003c               _Ht1621_DAT_1:
 276  003c 4bf0          	push	#240
 277  003e 4b04          	push	#4
 278  0040 ae500f        	ldw	x,#20495
 279  0043 cd0000        	call	_GPIO_Init
 281  0046 85            	popw	x
 285  0047 81            	ret
 309                     ; 16 void Ht1621_GND_0(void) { GPIO_Init(Ht1621_GND_PORT, Ht1621_GND_PIN, GPIO_Mode_Out_PP_Low_Slow);}  //
 310                     	switch	.text
 311  0048               _Ht1621_GND_0:
 317  0048 4bc0          	push	#192
 318  004a 4b08          	push	#8
 319  004c ae500f        	ldw	x,#20495
 320  004f cd0000        	call	_GPIO_Init
 322  0052 85            	popw	x
 326  0053 81            	ret
 350                     ; 17 void Ht1621_GND_1(void) { GPIO_Init(Ht1621_GND_PORT, Ht1621_GND_PIN, GPIO_Mode_Out_PP_High_Fast);}
 351                     	switch	.text
 352  0054               _Ht1621_GND_1:
 358  0054 4bf0          	push	#240
 359  0056 4b08          	push	#8
 360  0058 ae500f        	ldw	x,#20495
 361  005b cd0000        	call	_GPIO_Init
 363  005e 85            	popw	x
 367  005f 81            	ret
 391                     ; 19 void Ht1621_VCC_0(void) { GPIO_Init(Ht1621_VCC_PORT, Ht1621_VCC_PIN, GPIO_Mode_Out_PP_Low_Fast);}  //
 392                     	switch	.text
 393  0060               _Ht1621_VCC_0:
 399  0060 4be0          	push	#224
 400  0062 4b01          	push	#1
 401  0064 ae5005        	ldw	x,#20485
 402  0067 cd0000        	call	_GPIO_Init
 404  006a 85            	popw	x
 408  006b 81            	ret
 432                     ; 20 void Ht1621_VCC_1(void) { GPIO_Init(Ht1621_VCC_PORT, Ht1621_VCC_PIN, GPIO_Mode_Out_PP_High_Slow);}
 433                     	switch	.text
 434  006c               _Ht1621_VCC_1:
 440  006c 4bd0          	push	#208
 441  006e 4b01          	push	#1
 442  0070 ae5005        	ldw	x,#20485
 443  0073 cd0000        	call	_GPIO_Init
 445  0076 85            	popw	x
 449  0077 81            	ret
 505                     ; 31 void Ht1621Wr_Data(unsigned char Data,unsigned char cnt) 
 505                     ; 32 { 
 506                     	switch	.text
 507  0078               _Ht1621Wr_Data:
 509  0078 89            	pushw	x
 510  0079 88            	push	a
 511       00000001      OFST:	set	1
 514                     ; 34   for (i=0;i<cnt;i++) 
 516  007a 0f01          	clr	(OFST+0,sp)
 519  007c 2016          	jra	L361
 520  007e               L751:
 521                     ; 36      Ht1621_WR_0(); 
 523  007e ad98          	call	_Ht1621_WR_0
 525                     ; 37      if((Data & 0x80)==0x80) 
 527  0080 7b02          	ld	a,(OFST+1,sp)
 528  0082 a480          	and	a,#128
 529  0084 a180          	cp	a,#128
 530  0086 2604          	jrne	L761
 531                     ; 38         {Ht1621_DAT_1();}
 533  0088 adb2          	call	_Ht1621_DAT_1
 536  008a 2002          	jra	L171
 537  008c               L761:
 538                     ; 40         {Ht1621_DAT_0();}
 540  008c ada2          	call	_Ht1621_DAT_0
 542  008e               L171:
 543                     ; 41      Ht1621_WR_1(); 
 545  008e ad94          	call	_Ht1621_WR_1
 547                     ; 42      Data<<=1; 
 549  0090 0802          	sll	(OFST+1,sp)
 550                     ; 34   for (i=0;i<cnt;i++) 
 552  0092 0c01          	inc	(OFST+0,sp)
 554  0094               L361:
 557  0094 7b01          	ld	a,(OFST+0,sp)
 558  0096 1103          	cp	a,(OFST+2,sp)
 559  0098 25e4          	jrult	L751
 560                     ; 44 } 
 563  009a 5b03          	addw	sp,#3
 564  009c 81            	ret
 601                     ; 54 void Ht1621WrCmd(unsigned char Cmd) 
 601                     ; 55 { 
 602                     	switch	.text
 603  009d               _Ht1621WrCmd:
 605  009d 88            	push	a
 606       00000000      OFST:	set	0
 609                     ; 56    Ht1621_CS_0(); 
 611  009e cd0000        	call	_Ht1621_CS_0
 613                     ; 57    Ht1621Wr_Data(0x80,4);          //写入命令标志100 
 615  00a1 ae8004        	ldw	x,#32772
 616  00a4 add2          	call	_Ht1621Wr_Data
 618                     ; 58    Ht1621Wr_Data(Cmd,8);           //写入命令数据 
 620  00a6 7b01          	ld	a,(OFST+1,sp)
 621  00a8 ae0008        	ldw	x,#8
 622  00ab 95            	ld	xh,a
 623  00ac adca          	call	_Ht1621Wr_Data
 625                     ; 59    Ht1621_CS_1(); 
 627  00ae cd000c        	call	_Ht1621_CS_1
 629                     ; 60 } 
 632  00b1 84            	pop	a
 633  00b2 81            	ret
 679                     ; 70 void Ht1621WrOneData(unsigned char Addr,unsigned char Data)
 679                     ; 71 {
 680                     	switch	.text
 681  00b3               _Ht1621WrOneData:
 683  00b3 89            	pushw	x
 684       00000000      OFST:	set	0
 687                     ; 72   Ht1621_CS_0();
 689  00b4 cd0000        	call	_Ht1621_CS_0
 691                     ; 73   Ht1621Wr_Data(0xa0,3);  //写入数据标志101
 693  00b7 aea003        	ldw	x,#40963
 694  00ba adbc          	call	_Ht1621Wr_Data
 696                     ; 74   Ht1621Wr_Data(Addr<<2,6); //写入地址数据
 698  00bc 7b01          	ld	a,(OFST+1,sp)
 699  00be 48            	sll	a
 700  00bf 48            	sll	a
 701  00c0 ae0006        	ldw	x,#6
 702  00c3 95            	ld	xh,a
 703  00c4 adb2          	call	_Ht1621Wr_Data
 705                     ; 75   Ht1621Wr_Data(Data,4); //写入数据的前四位 7  6  5  4
 707  00c6 7b02          	ld	a,(OFST+2,sp)
 708  00c8 ae0004        	ldw	x,#4
 709  00cb 95            	ld	xh,a
 710  00cc adaa          	call	_Ht1621Wr_Data
 712                     ; 76   Ht1621_CS_1();
 714  00ce cd000c        	call	_Ht1621_CS_1
 716                     ; 77 }
 719  00d1 85            	popw	x
 720  00d2 81            	ret
 785                     ; 87 void Ht1621WrAllData(unsigned char Addr,unsigned char *p,unsigned char cnt)
 785                     ; 88 {
 786                     	switch	.text
 787  00d3               _Ht1621WrAllData:
 789  00d3 88            	push	a
 790  00d4 88            	push	a
 791       00000001      OFST:	set	1
 794                     ; 90   Ht1621_CS_0();
 796  00d5 cd0000        	call	_Ht1621_CS_0
 798                     ; 91   Ht1621Wr_Data(0xa0,3); //写入数据标志101
 800  00d8 aea003        	ldw	x,#40963
 801  00db ad9b          	call	_Ht1621Wr_Data
 803                     ; 92   Ht1621Wr_Data(Addr<<2,6); //写入地址数据
 805  00dd 7b02          	ld	a,(OFST+1,sp)
 806  00df 48            	sll	a
 807  00e0 48            	sll	a
 808  00e1 ae0006        	ldw	x,#6
 809  00e4 95            	ld	xh,a
 810  00e5 ad91          	call	_Ht1621Wr_Data
 812                     ; 93   for (i=0;i<cnt;i++)
 814  00e7 0f01          	clr	(OFST+0,sp)
 817  00e9 2012          	jra	L172
 818  00eb               L562:
 819                     ; 95     Ht1621Wr_Data(*p,8); //写入数据
 821  00eb 1e05          	ldw	x,(OFST+4,sp)
 822  00ed f6            	ld	a,(x)
 823  00ee ae0008        	ldw	x,#8
 824  00f1 95            	ld	xh,a
 825  00f2 ad84          	call	_Ht1621Wr_Data
 827                     ; 96     p++;
 829  00f4 1e05          	ldw	x,(OFST+4,sp)
 830  00f6 1c0001        	addw	x,#1
 831  00f9 1f05          	ldw	(OFST+4,sp),x
 832                     ; 93   for (i=0;i<cnt;i++)
 834  00fb 0c01          	inc	(OFST+0,sp)
 836  00fd               L172:
 839  00fd 7b01          	ld	a,(OFST+0,sp)
 840  00ff 1107          	cp	a,(OFST+6,sp)
 841  0101 25e8          	jrult	L562
 842                     ; 98   Ht1621_CS_1();
 844  0103 cd000c        	call	_Ht1621_CS_1
 846                     ; 99 }
 849  0106 85            	popw	x
 850  0107 81            	ret
 876                     ; 109 void Ht1621_Init(void) 
 876                     ; 110 { 
 877                     	switch	.text
 878  0108               _Ht1621_Init:
 882                     ; 111     Ht1621_GND_0();       //HT1621 power on
 884  0108 cd0048        	call	_Ht1621_GND_0
 886                     ; 112     Ht1621_VCC_1();
 888  010b cd006c        	call	_Ht1621_VCC_1
 890                     ; 113    Ht1621WrCmd(BIAS); 
 892  010e a652          	ld	a,#82
 893  0110 ad8b          	call	_Ht1621WrCmd
 895                     ; 114    Ht1621WrCmd(RC256);             //使用内部振荡器 
 897  0112 a630          	ld	a,#48
 898  0114 ad87          	call	_Ht1621WrCmd
 900                     ; 116    Ht1621WrCmd(SYSDIS); 
 902  0116 4f            	clr	a
 903  0117 ad84          	call	_Ht1621WrCmd
 905                     ; 117    Ht1621WrCmd(WDTDIS1); 
 907  0119 a60a          	ld	a,#10
 908  011b ad80          	call	_Ht1621WrCmd
 910                     ; 118    Ht1621WrCmd(SYSEN); 
 912  011d a602          	ld	a,#2
 913  011f cd009d        	call	_Ht1621WrCmd
 915                     ; 119    Ht1621WrCmd(LCDON); 
 917  0122 a606          	ld	a,#6
 918  0124 cd009d        	call	_Ht1621WrCmd
 920                     ; 120 } 
 923  0127 81            	ret
 952                     ; 130 void Display(void) 
 952                     ; 131 { 
 953                     	switch	.text
 954  0128               _Display:
 958                     ; 133    Ht1621WrOneData(0 , DispTab[n4]);
 960  0128 be00          	ldw	x,_n4
 961  012a e600          	ld	a,(_DispTab,x)
 962  012c 5f            	clrw	x
 963  012d 97            	ld	xl,a
 964  012e ad83          	call	_Ht1621WrOneData
 966                     ; 134    Ht1621WrOneData(1 , DispTab[n4]<<4);
 968  0130 be00          	ldw	x,_n4
 969  0132 e600          	ld	a,(_DispTab,x)
 970  0134 97            	ld	xl,a
 971  0135 a610          	ld	a,#16
 972  0137 42            	mul	x,a
 973  0138 9f            	ld	a,xl
 974  0139 ae0100        	ldw	x,#256
 975  013c 97            	ld	xl,a
 976  013d cd00b3        	call	_Ht1621WrOneData
 978                     ; 136    Ht1621WrOneData(2 , DispTab[n3]);
 980  0140 be02          	ldw	x,_n3
 981  0142 e600          	ld	a,(_DispTab,x)
 982  0144 ae0200        	ldw	x,#512
 983  0147 97            	ld	xl,a
 984  0148 cd00b3        	call	_Ht1621WrOneData
 986                     ; 137    Ht1621WrOneData(3 , DispTab[n3]<<4);
 988  014b be02          	ldw	x,_n3
 989  014d e600          	ld	a,(_DispTab,x)
 990  014f 97            	ld	xl,a
 991  0150 a610          	ld	a,#16
 992  0152 42            	mul	x,a
 993  0153 9f            	ld	a,xl
 994  0154 ae0300        	ldw	x,#768
 995  0157 97            	ld	xl,a
 996  0158 cd00b3        	call	_Ht1621WrOneData
 998                     ; 139    Ht1621WrOneData(4 , DispTab[n2]);
1000  015b be04          	ldw	x,_n2
1001  015d e600          	ld	a,(_DispTab,x)
1002  015f ae0400        	ldw	x,#1024
1003  0162 97            	ld	xl,a
1004  0163 cd00b3        	call	_Ht1621WrOneData
1006                     ; 140    Ht1621WrOneData(5 , DispTab[n2]<<4);
1008  0166 be04          	ldw	x,_n2
1009  0168 e600          	ld	a,(_DispTab,x)
1010  016a 97            	ld	xl,a
1011  016b a610          	ld	a,#16
1012  016d 42            	mul	x,a
1013  016e 9f            	ld	a,xl
1014  016f ae0500        	ldw	x,#1280
1015  0172 97            	ld	xl,a
1016  0173 cd00b3        	call	_Ht1621WrOneData
1018                     ; 142    Ht1621WrOneData(6 , DispTab[n1]); 
1020  0176 be06          	ldw	x,_n1
1021  0178 e600          	ld	a,(_DispTab,x)
1022  017a ae0600        	ldw	x,#1536
1023  017d 97            	ld	xl,a
1024  017e cd00b3        	call	_Ht1621WrOneData
1026                     ; 143    Ht1621WrOneData(7 , DispTab[n1]<<4); 
1028  0181 be06          	ldw	x,_n1
1029  0183 e600          	ld	a,(_DispTab,x)
1030  0185 97            	ld	xl,a
1031  0186 a610          	ld	a,#16
1032  0188 42            	mul	x,a
1033  0189 9f            	ld	a,xl
1034  018a ae0700        	ldw	x,#1792
1035  018d 97            	ld	xl,a
1036  018e cd00b3        	call	_Ht1621WrOneData
1038                     ; 145 }
1041  0191 81            	ret
1067                     ; 155 void Display_lcd_dot(void) 
1067                     ; 156 { 
1068                     	switch	.text
1069  0192               _Display_lcd_dot:
1073                     ; 157   Ht1621WrOneData(0 , DispTab[n4]|0x10);//P1
1075  0192 be00          	ldw	x,_n4
1076  0194 e600          	ld	a,(_DispTab,x)
1077  0196 aa10          	or	a,#16
1078  0198 5f            	clrw	x
1079  0199 97            	ld	xl,a
1080  019a cd00b3        	call	_Ht1621WrOneData
1082                     ; 161 }
1085  019d 81            	ret
1124                     ; 171 void data_convertor(unsigned long adc_value) 
1124                     ; 172 {  
1125                     	switch	.text
1126  019e               _data_convertor:
1128       00000000      OFST:	set	0
1131                     ; 173     tmp=adc_value;         //adc 
1133  019e 1e05          	ldw	x,(OFST+5,sp)
1134  01a0 bf08          	ldw	_tmp,x
1135                     ; 174     n4=tmp/1000;
1137  01a2 be08          	ldw	x,_tmp
1138  01a4 90ae03e8      	ldw	y,#1000
1139  01a8 65            	divw	x,y
1140  01a9 bf00          	ldw	_n4,x
1141                     ; 175     tmp=tmp%1000;
1143  01ab be08          	ldw	x,_tmp
1144  01ad 90ae03e8      	ldw	y,#1000
1145  01b1 65            	divw	x,y
1146  01b2 51            	exgw	x,y
1147  01b3 bf08          	ldw	_tmp,x
1148                     ; 176     n3=tmp/100;
1150  01b5 be08          	ldw	x,_tmp
1151  01b7 a664          	ld	a,#100
1152  01b9 62            	div	x,a
1153  01ba bf02          	ldw	_n3,x
1154                     ; 177     tmp=tmp%100;	
1156  01bc be08          	ldw	x,_tmp
1157  01be a664          	ld	a,#100
1158  01c0 62            	div	x,a
1159  01c1 5f            	clrw	x
1160  01c2 97            	ld	xl,a
1161  01c3 bf08          	ldw	_tmp,x
1162                     ; 178     n2=tmp/10;
1164  01c5 be08          	ldw	x,_tmp
1165  01c7 a60a          	ld	a,#10
1166  01c9 62            	div	x,a
1167  01ca bf04          	ldw	_n2,x
1168                     ; 179     tmp=tmp%10;		
1170  01cc be08          	ldw	x,_tmp
1171  01ce a60a          	ld	a,#10
1172  01d0 62            	div	x,a
1173  01d1 5f            	clrw	x
1174  01d2 97            	ld	xl,a
1175  01d3 bf08          	ldw	_tmp,x
1176                     ; 180     n1=tmp; 
1178  01d5 be08          	ldw	x,_tmp
1179  01d7 bf06          	ldw	_n1,x
1180                     ; 181  }
1183  01d9 81            	ret
1253                     	xdef	_Ht1621_VCC_1
1254                     	xdef	_Ht1621_VCC_0
1255                     	xdef	_Ht1621_GND_1
1256                     	xdef	_Ht1621_GND_0
1257                     	xdef	_Ht1621_DAT_1
1258                     	xdef	_Ht1621_DAT_0
1259                     	xdef	_Ht1621_WR_1
1260                     	xdef	_Ht1621_WR_0
1261                     	xdef	_Ht1621_CS_1
1262                     	xdef	_Ht1621_CS_0
1263                     	xdef	_DispTab
1264                     	switch	.ubsct
1265  0000               _n4:
1266  0000 0000          	ds.b	2
1267                     	xdef	_n4
1268  0002               _n3:
1269  0002 0000          	ds.b	2
1270                     	xdef	_n3
1271  0004               _n2:
1272  0004 0000          	ds.b	2
1273                     	xdef	_n2
1274  0006               _n1:
1275  0006 0000          	ds.b	2
1276                     	xdef	_n1
1277  0008               _tmp:
1278  0008 0000          	ds.b	2
1279                     	xdef	_tmp
1280                     	xdef	_data_convertor
1281                     	xdef	_Display_lcd_dot
1282                     	xdef	_Display
1283                     	xdef	_Ht1621_Init
1284                     	xdef	_Ht1621WrAllData
1285                     	xdef	_Ht1621WrOneData
1286                     	xdef	_Ht1621WrCmd
1287                     	xdef	_Ht1621Wr_Data
1288                     	xref	_GPIO_Init
1308                     	end
