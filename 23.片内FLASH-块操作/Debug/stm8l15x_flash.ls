   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  67                     ; 168 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  67                     ; 169 {
  69                     	switch	.text
  70  0000               _FLASH_SetProgrammingTime:
  74                     ; 171   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  76                     ; 173   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  78  0000 72115050      	bres	20560,#0
  79                     ; 174   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  81  0004 ca5050        	or	a,20560
  82  0007 c75050        	ld	20560,a
  83                     ; 175 }
  86  000a 81            	ret
 111                     ; 182 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 111                     ; 183 {
 112                     	switch	.text
 113  000b               _FLASH_GetProgrammingTime:
 117                     ; 184   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 119  000b c65050        	ld	a,20560
 120  000e a401          	and	a,#1
 123  0010 81            	ret
 179                     ; 197 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 179                     ; 198 {
 180                     	switch	.text
 181  0011               _FLASH_PowerWaitModeConfig:
 185                     ; 200   assert_param(IS_FLASH_POWER(FLASH_Power));
 187                     ; 203   if (FLASH_Power != FLASH_Power_On)
 189  0011 a101          	cp	a,#1
 190  0013 2706          	jreq	L57
 191                     ; 205     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 193  0015 72145050      	bset	20560,#2
 195  0019 2004          	jra	L77
 196  001b               L57:
 197                     ; 210     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 199  001b 72155050      	bres	20560,#2
 200  001f               L77:
 201                     ; 212 }
 204  001f 81            	ret
 227                     ; 253 void FLASH_DeInit(void)
 227                     ; 254 {
 228                     	switch	.text
 229  0020               _FLASH_DeInit:
 233                     ; 255   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 235  0020 725f5050      	clr	20560
 236                     ; 256   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 238  0024 725f5051      	clr	20561
 239                     ; 257   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 241  0028 35405054      	mov	20564,#64
 242                     ; 258   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 244  002c c65054        	ld	a,20564
 245  002f 97            	ld	xl,a
 246                     ; 259 }
 249  0030 81            	ret
 305                     ; 269 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 305                     ; 270 {
 306                     	switch	.text
 307  0031               _FLASH_Unlock:
 309  0031 88            	push	a
 310       00000000      OFST:	set	0
 313                     ; 272   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 315                     ; 275   if (FLASH_MemType == FLASH_MemType_Program)
 317  0032 a1fd          	cp	a,#253
 318  0034 2608          	jrne	L731
 319                     ; 277     FLASH->PUKR = FLASH_RASS_KEY1;
 321  0036 35565052      	mov	20562,#86
 322                     ; 278     FLASH->PUKR = FLASH_RASS_KEY2;
 324  003a 35ae5052      	mov	20562,#174
 325  003e               L731:
 326                     ; 282   if (FLASH_MemType == FLASH_MemType_Data)
 328  003e 7b01          	ld	a,(OFST+1,sp)
 329  0040 a1f7          	cp	a,#247
 330  0042 2608          	jrne	L141
 331                     ; 284     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 333  0044 35ae5053      	mov	20563,#174
 334                     ; 285     FLASH->DUKR = FLASH_RASS_KEY1;
 336  0048 35565053      	mov	20563,#86
 337  004c               L141:
 338                     ; 287 }
 341  004c 84            	pop	a
 342  004d 81            	ret
 377                     ; 297 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 377                     ; 298 {
 378                     	switch	.text
 379  004e               _FLASH_Lock:
 383                     ; 300   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 385                     ; 302   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 387  004e c45054        	and	a,20564
 388  0051 c75054        	ld	20564,a
 389                     ; 303 }
 392  0054 81            	ret
 435                     ; 311 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 435                     ; 312 {
 436                     	switch	.text
 437  0055               _FLASH_ProgramByte:
 439       00000000      OFST:	set	0
 442                     ; 314   assert_param(IS_FLASH_ADDRESS(Address));
 444                     ; 316   *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 446  0055 7b07          	ld	a,(OFST+7,sp)
 447  0057 1e05          	ldw	x,(OFST+5,sp)
 448  0059 f7            	ld	(x),a
 449                     ; 317 }
 452  005a 81            	ret
 486                     ; 324 void FLASH_EraseByte(uint32_t Address)
 486                     ; 325 {
 487                     	switch	.text
 488  005b               _FLASH_EraseByte:
 490       00000000      OFST:	set	0
 493                     ; 327   assert_param(IS_FLASH_ADDRESS(Address));
 495                     ; 329   *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 497  005b 1e05          	ldw	x,(OFST+5,sp)
 498  005d 7f            	clr	(x)
 499                     ; 330 }
 502  005e 81            	ret
 545                     ; 338 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 545                     ; 339 {
 546                     	switch	.text
 547  005f               _FLASH_ProgramWord:
 549       00000000      OFST:	set	0
 552                     ; 341   assert_param(IS_FLASH_ADDRESS(Address));
 554                     ; 343   FLASH->CR2 |= FLASH_CR2_WPRG;
 556  005f 721c5051      	bset	20561,#6
 557                     ; 346   *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));   
 559  0063 7b07          	ld	a,(OFST+7,sp)
 560  0065 1e05          	ldw	x,(OFST+5,sp)
 561  0067 f7            	ld	(x),a
 562                     ; 348   *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data) + 1);
 564  0068 7b08          	ld	a,(OFST+8,sp)
 565  006a 1e05          	ldw	x,(OFST+5,sp)
 566  006c e701          	ld	(1,x),a
 567                     ; 350   *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 569  006e 7b09          	ld	a,(OFST+9,sp)
 570  0070 1e05          	ldw	x,(OFST+5,sp)
 571  0072 e702          	ld	(2,x),a
 572                     ; 352   *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 574  0074 7b0a          	ld	a,(OFST+10,sp)
 575  0076 1e05          	ldw	x,(OFST+5,sp)
 576  0078 e703          	ld	(3,x),a
 577                     ; 353 }
 580  007a 81            	ret
 614                     ; 360 uint8_t FLASH_ReadByte(uint32_t Address)
 614                     ; 361 {
 615                     	switch	.text
 616  007b               _FLASH_ReadByte:
 618       00000000      OFST:	set	0
 621                     ; 363   return(*(PointerAttr uint8_t *) (uint16_t)Address);
 623  007b 1e05          	ldw	x,(OFST+5,sp)
 624  007d f6            	ld	a,(x)
 627  007e 81            	ret
 672                     ; 410 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 672                     ; 411 {
 673                     	switch	.text
 674  007f               _FLASH_ProgramOptionByte:
 676  007f 89            	pushw	x
 677       00000000      OFST:	set	0
 680                     ; 413   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 682                     ; 416   FLASH->CR2 |= FLASH_CR2_OPT;
 684  0080 721e5051      	bset	20561,#7
 685                     ; 419   *((PointerAttr uint8_t*)Address) = Data;
 687  0084 7b05          	ld	a,(OFST+5,sp)
 688  0086 1e01          	ldw	x,(OFST+1,sp)
 689  0088 f7            	ld	(x),a
 690                     ; 421   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 692  0089 a6fd          	ld	a,#253
 693  008b cd00c9        	call	_FLASH_WaitForLastOperation
 695                     ; 424   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 697  008e 721f5051      	bres	20561,#7
 698                     ; 425 }
 701  0092 85            	popw	x
 702  0093 81            	ret
 738                     ; 432 void FLASH_EraseOptionByte(uint16_t Address)
 738                     ; 433 {
 739                     	switch	.text
 740  0094               _FLASH_EraseOptionByte:
 744                     ; 435   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 746                     ; 438   FLASH->CR2 |= FLASH_CR2_OPT;
 748  0094 721e5051      	bset	20561,#7
 749                     ; 441   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 751  0098 7f            	clr	(x)
 752                     ; 443   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 754  0099 a6fd          	ld	a,#253
 755  009b cd00c9        	call	_FLASH_WaitForLastOperation
 757                     ; 446   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 759  009e 721f5051      	bres	20561,#7
 760                     ; 447 }
 763  00a2 81            	ret
 820                     ; 455 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 820                     ; 456 {
 821                     	switch	.text
 822  00a3               _FLASH_GetReadOutProtectionStatus:
 824  00a3 88            	push	a
 825       00000001      OFST:	set	1
 828                     ; 457   FunctionalState state = DISABLE;
 830  00a4 0f01          	clr	(OFST+0,sp)
 831                     ; 459   if (OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 833  00a6 c64800        	ld	a,18432
 834  00a9 a1aa          	cp	a,#170
 835  00ab 2606          	jrne	L743
 836                     ; 462     state =  ENABLE;
 838  00ad a601          	ld	a,#1
 839  00af 6b01          	ld	(OFST+0,sp),a
 841  00b1 2002          	jra	L153
 842  00b3               L743:
 843                     ; 467     state =  DISABLE;
 845  00b3 0f01          	clr	(OFST+0,sp)
 846  00b5               L153:
 847                     ; 470   return state;
 849  00b5 7b01          	ld	a,(OFST+0,sp)
 852  00b7 5b01          	addw	sp,#1
 853  00b9 81            	ret
 887                     ; 478 uint16_t FLASH_GetBootSize(void)
 887                     ; 479 {
 888                     	switch	.text
 889  00ba               _FLASH_GetBootSize:
 891  00ba 89            	pushw	x
 892       00000002      OFST:	set	2
 895                     ; 480   uint16_t temp = 0;
 897  00bb 5f            	clrw	x
 898  00bc 1f01          	ldw	(OFST-1,sp),x
 899                     ; 483   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 901  00be c64802        	ld	a,18434
 902  00c1 5f            	clrw	x
 903  00c2 97            	ld	xl,a
 904  00c3 4f            	clr	a
 905  00c4 02            	rlwa	x,a
 906  00c5 44            	srl	a
 907  00c6 56            	rrcw	x
 908  00c7 1f01          	ldw	(OFST-1,sp),x
 909                     ; 486   if (OPT->UBC > 0x7F)
 911  00c9 c64802        	ld	a,18434
 912  00cc a180          	cp	a,#128
 913  00ce 2505          	jrult	L173
 914                     ; 488     temp = 8192;
 916  00d0 ae2000        	ldw	x,#8192
 917  00d3 1f01          	ldw	(OFST-1,sp),x
 918  00d5               L173:
 919                     ; 492   return(temp);
 921  00d5 1e01          	ldw	x,(OFST-1,sp)
 924  00d7 5b02          	addw	sp,#2
 925  00d9 81            	ret
 959                     ; 502 uint16_t FLASH_GetCodeSize(void)
 959                     ; 503 {
 960                     	switch	.text
 961  00da               _FLASH_GetCodeSize:
 963  00da 89            	pushw	x
 964       00000002      OFST:	set	2
 967                     ; 504   uint16_t temp = 0;
 969  00db 5f            	clrw	x
 970  00dc 1f01          	ldw	(OFST-1,sp),x
 971                     ; 507   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 973  00de c64807        	ld	a,18439
 974  00e1 5f            	clrw	x
 975  00e2 97            	ld	xl,a
 976  00e3 4f            	clr	a
 977  00e4 02            	rlwa	x,a
 978  00e5 44            	srl	a
 979  00e6 56            	rrcw	x
 980  00e7 1f01          	ldw	(OFST-1,sp),x
 981                     ; 510   if (OPT->PCODESIZE > 0x7F)
 983  00e9 c64807        	ld	a,18439
 984  00ec a180          	cp	a,#128
 985  00ee 2505          	jrult	L114
 986                     ; 512     temp = 8192;
 988  00f0 ae2000        	ldw	x,#8192
 989  00f3 1f01          	ldw	(OFST-1,sp),x
 990  00f5               L114:
 991                     ; 516   return(temp);
 993  00f5 1e01          	ldw	x,(OFST-1,sp)
 996  00f7 5b02          	addw	sp,#2
 997  00f9 81            	ret
1032                     ; 541 void FLASH_ITConfig(FunctionalState NewState)
1032                     ; 542 {
1033                     	switch	.text
1034  00fa               _FLASH_ITConfig:
1038                     ; 545   assert_param(IS_FUNCTIONAL_STATE(NewState));
1040                     ; 547   if (NewState != DISABLE)
1042  00fa 4d            	tnz	a
1043  00fb 2706          	jreq	L134
1044                     ; 550     FLASH->CR1 |= FLASH_CR1_IE;
1046  00fd 72125050      	bset	20560,#1
1048  0101 2004          	jra	L334
1049  0103               L134:
1050                     ; 555     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1052  0103 72135050      	bres	20560,#1
1053  0107               L334:
1054                     ; 557 }
1057  0107 81            	ret
1166                     ; 571 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1166                     ; 572 {
1167                     	switch	.text
1168  0108               _FLASH_GetFlagStatus:
1170  0108 88            	push	a
1171       00000001      OFST:	set	1
1174                     ; 573   FlagStatus status = RESET;
1176  0109 0f01          	clr	(OFST+0,sp)
1177                     ; 574   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1179                     ; 577   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1181  010b c45054        	and	a,20564
1182  010e 2706          	jreq	L505
1183                     ; 579     status = SET; /* Flash_FLAG is set*/
1185  0110 a601          	ld	a,#1
1186  0112 6b01          	ld	(OFST+0,sp),a
1188  0114 2002          	jra	L705
1189  0116               L505:
1190                     ; 583     status = RESET; /* Flash_FLAG is reset*/
1192  0116 0f01          	clr	(OFST+0,sp)
1193  0118               L705:
1194                     ; 587   return status;
1196  0118 7b01          	ld	a,(OFST+0,sp)
1199  011a 5b01          	addw	sp,#1
1200  011c 81            	ret
1236                     ; 703 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1236                     ; 704 {
1237                     .FLASH_CODE:	section	.text
1238  0000               _FLASH_PowerRunModeConfig:
1242                     ; 706   assert_param(IS_FLASH_POWER(FLASH_Power));
1244                     ; 708   if (FLASH_Power != FLASH_Power_On)
1246  0000 a101          	cp	a,#1
1247  0002 2706          	jreq	L725
1248                     ; 710   FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1250  0004 72165050      	bset	20560,#3
1252  0008 2004          	jra	L135
1253  000a               L725:
1254                     ; 714     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1256  000a 72175050      	bres	20560,#3
1257  000e               L135:
1258                     ; 716 }
1261  000e 81            	ret
1325                     ; 729 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1325                     ; 730 {
1326                     	switch	.FLASH_CODE
1327  000f               _FLASH_GetPowerStatus:
1331                     ; 731   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1333  000f c65050        	ld	a,20560
1334  0012 a40c          	and	a,#12
1337  0014 81            	ret
1441                     ; 749 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1441                     ; 750                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1441                     ; 751 {
1442                     	switch	.FLASH_CODE
1443  0015               _FLASH_ProgramBlock:
1445  0015 89            	pushw	x
1446  0016 5206          	subw	sp,#6
1447       00000006      OFST:	set	6
1450                     ; 752   uint16_t Count = 0;
1452  0018 1e05          	ldw	x,(OFST-1,sp)
1453                     ; 753   uint32_t startaddress = 0;
1455  001a 96            	ldw	x,sp
1456  001b 1c0001        	addw	x,#OFST-5
1457  001e cd0000        	call	c_ltor
1459                     ; 756   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1461                     ; 757   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1463                     ; 758   if (FLASH_MemType == FLASH_MemType_Program)
1465  0021 7b0b          	ld	a,(OFST+5,sp)
1466  0023 a1fd          	cp	a,#253
1467  0025 260c          	jrne	L136
1468                     ; 760   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1470                     ; 761     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1472  0027 ae8000        	ldw	x,#32768
1473  002a 1f03          	ldw	(OFST-3,sp),x
1474  002c ae0000        	ldw	x,#0
1475  002f 1f01          	ldw	(OFST-5,sp),x
1477  0031 200a          	jra	L336
1478  0033               L136:
1479                     ; 765     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1481                     ; 766     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1483  0033 ae1000        	ldw	x,#4096
1484  0036 1f03          	ldw	(OFST-3,sp),x
1485  0038 ae0000        	ldw	x,#0
1486  003b 1f01          	ldw	(OFST-5,sp),x
1487  003d               L336:
1488                     ; 770   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1490  003d 1e07          	ldw	x,(OFST+1,sp)
1491  003f a680          	ld	a,#128
1492  0041 cd0000        	call	c_cmulx
1494  0044 96            	ldw	x,sp
1495  0045 1c0001        	addw	x,#OFST-5
1496  0048 cd0000        	call	c_lgadd
1498                     ; 773   if (FLASH_ProgMode == FLASH_ProgramMode_Standard)
1500  004b 0d0c          	tnz	(OFST+6,sp)
1501  004d 2606          	jrne	L536
1502                     ; 776   FLASH->CR2 |= FLASH_CR2_PRG;
1504  004f 72105051      	bset	20561,#0
1506  0053 2004          	jra	L736
1507  0055               L536:
1508                     ; 781   FLASH->CR2 |= FLASH_CR2_FPRG;
1510  0055 72185051      	bset	20561,#4
1511  0059               L736:
1512                     ; 785   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1514  0059 5f            	clrw	x
1515  005a 1f05          	ldw	(OFST-1,sp),x
1516  005c               L146:
1517                     ; 788   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1519  005c 1e0d          	ldw	x,(OFST+7,sp)
1520  005e 72fb05        	addw	x,(OFST-1,sp)
1521  0061 f6            	ld	a,(x)
1522  0062 1e03          	ldw	x,(OFST-3,sp)
1523  0064 72fb05        	addw	x,(OFST-1,sp)
1524  0067 f7            	ld	(x),a
1525                     ; 785   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1527  0068 1e05          	ldw	x,(OFST-1,sp)
1528  006a 1c0001        	addw	x,#1
1529  006d 1f05          	ldw	(OFST-1,sp),x
1532  006f 1e05          	ldw	x,(OFST-1,sp)
1533  0071 a30080        	cpw	x,#128
1534  0074 25e6          	jrult	L146
1535                     ; 793 }
1538  0076 5b08          	addw	sp,#8
1539  0078 81            	ret
1602                     ; 805 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1602                     ; 806 {
1603                     	switch	.FLASH_CODE
1604  0079               _FLASH_EraseBlock:
1606  0079 89            	pushw	x
1607  007a 5206          	subw	sp,#6
1608       00000006      OFST:	set	6
1611                     ; 807   uint32_t startaddress = 0;
1613  007c 96            	ldw	x,sp
1614  007d 1c0003        	addw	x,#OFST-3
1615  0080 cd0000        	call	c_ltor
1617                     ; 815   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1619                     ; 816   if (FLASH_MemType == FLASH_MemType_Program)
1621  0083 7b0b          	ld	a,(OFST+5,sp)
1622  0085 a1fd          	cp	a,#253
1623  0087 260c          	jrne	L107
1624                     ; 818   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1626                     ; 819     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1628  0089 ae8000        	ldw	x,#32768
1629  008c 1f05          	ldw	(OFST-1,sp),x
1630  008e ae0000        	ldw	x,#0
1631  0091 1f03          	ldw	(OFST-3,sp),x
1633  0093 200a          	jra	L307
1634  0095               L107:
1635                     ; 823     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1637                     ; 824     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1639  0095 ae1000        	ldw	x,#4096
1640  0098 1f05          	ldw	(OFST-1,sp),x
1641  009a ae0000        	ldw	x,#0
1642  009d 1f03          	ldw	(OFST-3,sp),x
1643  009f               L307:
1644                     ; 829   pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1646  009f 1e07          	ldw	x,(OFST+1,sp)
1647  00a1 a680          	ld	a,#128
1648  00a3 cd0000        	call	c_cmulx
1650  00a6 96            	ldw	x,sp
1651  00a7 1c0003        	addw	x,#OFST-3
1652  00aa cd0000        	call	c_ladd
1654  00ad be02          	ldw	x,c_lreg+2
1655  00af 1f01          	ldw	(OFST-5,sp),x
1656                     ; 835   FLASH->CR2 |= FLASH_CR2_ERASE;
1658  00b1 721a5051      	bset	20561,#5
1659                     ; 838   *pwFlash = (uint32_t)0;
1661  00b5 1e01          	ldw	x,(OFST-5,sp)
1662  00b7 a600          	ld	a,#0
1663  00b9 e703          	ld	(3,x),a
1664  00bb a600          	ld	a,#0
1665  00bd e702          	ld	(2,x),a
1666  00bf a600          	ld	a,#0
1667  00c1 e701          	ld	(1,x),a
1668  00c3 a600          	ld	a,#0
1669  00c5 f7            	ld	(x),a
1670                     ; 845 }
1673  00c6 5b08          	addw	sp,#8
1674  00c8 81            	ret
1759                     ; 857 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1759                     ; 858 {
1760                     	switch	.FLASH_CODE
1761  00c9               _FLASH_WaitForLastOperation:
1763  00c9 5205          	subw	sp,#5
1764       00000005      OFST:	set	5
1767                     ; 859   uint32_t timeout = OPERATION_TIMEOUT;
1769  00cb aeffff        	ldw	x,#65535
1770  00ce 1f03          	ldw	(OFST-2,sp),x
1771  00d0 ae0000        	ldw	x,#0
1772  00d3 1f01          	ldw	(OFST-4,sp),x
1773                     ; 860   uint8_t flagstatus = 0x00;
1775  00d5 0f05          	clr	(OFST+0,sp)
1776                     ; 862   if (FLASH_MemType == FLASH_MemType_Program)
1778  00d7 a1fd          	cp	a,#253
1779  00d9 2631          	jrne	L367
1781  00db 2010          	jra	L157
1782  00dd               L747:
1783                     ; 866       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1783                     ; 867                              FLASH_IAPSR_WR_PG_DIS));
1785  00dd c65054        	ld	a,20564
1786  00e0 a405          	and	a,#5
1787  00e2 6b05          	ld	(OFST+0,sp),a
1788                     ; 868       timeout--;
1790  00e4 96            	ldw	x,sp
1791  00e5 1c0001        	addw	x,#OFST-4
1792  00e8 a601          	ld	a,#1
1793  00ea cd0000        	call	c_lgsbc
1795  00ed               L157:
1796                     ; 864   while ((flagstatus == 0x00) && (timeout != 0x00))
1798  00ed 0d05          	tnz	(OFST+0,sp)
1799  00ef 2628          	jrne	L757
1801  00f1 96            	ldw	x,sp
1802  00f2 1c0001        	addw	x,#OFST-4
1803  00f5 cd0000        	call	c_lzmp
1805  00f8 26e3          	jrne	L747
1806  00fa 201d          	jra	L757
1807  00fc               L167:
1808                     ; 875       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1808                     ; 876                              FLASH_IAPSR_WR_PG_DIS));
1810  00fc c65054        	ld	a,20564
1811  00ff a441          	and	a,#65
1812  0101 6b05          	ld	(OFST+0,sp),a
1813                     ; 877       timeout--;
1815  0103 96            	ldw	x,sp
1816  0104 1c0001        	addw	x,#OFST-4
1817  0107 a601          	ld	a,#1
1818  0109 cd0000        	call	c_lgsbc
1820  010c               L367:
1821                     ; 873     while ((flagstatus == 0x00) && (timeout != 0x00))
1823  010c 0d05          	tnz	(OFST+0,sp)
1824  010e 2609          	jrne	L757
1826  0110 96            	ldw	x,sp
1827  0111 1c0001        	addw	x,#OFST-4
1828  0114 cd0000        	call	c_lzmp
1830  0117 26e3          	jrne	L167
1831  0119               L757:
1832                     ; 880   if (timeout == 0x00 )
1834  0119 96            	ldw	x,sp
1835  011a 1c0001        	addw	x,#OFST-4
1836  011d cd0000        	call	c_lzmp
1838  0120 2604          	jrne	L177
1839                     ; 882   flagstatus = FLASH_Status_TimeOut;
1841  0122 a602          	ld	a,#2
1842  0124 6b05          	ld	(OFST+0,sp),a
1843  0126               L177:
1844                     ; 885   return((FLASH_Status_TypeDef)flagstatus);
1846  0126 7b05          	ld	a,(OFST+0,sp)
1849  0128 5b05          	addw	sp,#5
1850  012a 81            	ret
1863                     	xdef	_FLASH_WaitForLastOperation
1864                     	xdef	_FLASH_EraseBlock
1865                     	xdef	_FLASH_ProgramBlock
1866                     	xdef	_FLASH_GetPowerStatus
1867                     	xdef	_FLASH_PowerRunModeConfig
1868                     	xdef	_FLASH_GetFlagStatus
1869                     	xdef	_FLASH_ITConfig
1870                     	xdef	_FLASH_EraseOptionByte
1871                     	xdef	_FLASH_ProgramOptionByte
1872                     	xdef	_FLASH_GetReadOutProtectionStatus
1873                     	xdef	_FLASH_GetCodeSize
1874                     	xdef	_FLASH_GetBootSize
1875                     	xdef	_FLASH_ReadByte
1876                     	xdef	_FLASH_ProgramWord
1877                     	xdef	_FLASH_EraseByte
1878                     	xdef	_FLASH_ProgramByte
1879                     	xdef	_FLASH_Lock
1880                     	xdef	_FLASH_Unlock
1881                     	xdef	_FLASH_DeInit
1882                     	xdef	_FLASH_PowerWaitModeConfig
1883                     	xdef	_FLASH_SetProgrammingTime
1884                     	xdef	_FLASH_GetProgrammingTime
1885                     	xref.b	c_lreg
1904                     	xref	c_lzmp
1905                     	xref	c_lgsbc
1906                     	xref	c_ladd
1907                     	xref	c_lgadd
1908                     	xref	c_cmulx
1909                     	xref	c_ltor
1910                     	end
