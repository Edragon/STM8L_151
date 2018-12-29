   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  77                     ; 168 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  77                     ; 169 {
  79                     	switch	.text
  80  0000               _FLASH_SetProgrammingTime:
  84                     ; 171   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  86                     ; 173   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  88  0000 72115050      	bres	20560,#0
  89                     ; 174   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  91  0004 ca5050        	or	a,20560
  92  0007 c75050        	ld	20560,a
  93                     ; 175 }
  96  000a 81            	ret
 121                     ; 182 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 121                     ; 183 {
 122                     	switch	.text
 123  000b               _FLASH_GetProgrammingTime:
 127                     ; 184   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 129  000b c65050        	ld	a,20560
 130  000e a401          	and	a,#1
 133  0010 81            	ret
 189                     ; 197 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 189                     ; 198 {
 190                     	switch	.text
 191  0011               _FLASH_PowerWaitModeConfig:
 195                     ; 200   assert_param(IS_FLASH_POWER(FLASH_Power));
 197                     ; 203   if (FLASH_Power != FLASH_Power_On)
 199  0011 a101          	cp	a,#1
 200  0013 2706          	jreq	L57
 201                     ; 205     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 203  0015 72145050      	bset	20560,#2
 205  0019 2004          	jra	L77
 206  001b               L57:
 207                     ; 210     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 209  001b 72155050      	bres	20560,#2
 210  001f               L77:
 211                     ; 212 }
 214  001f 81            	ret
 237                     ; 253 void FLASH_DeInit(void)
 237                     ; 254 {
 238                     	switch	.text
 239  0020               _FLASH_DeInit:
 243                     ; 255   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 245  0020 725f5050      	clr	20560
 246                     ; 256   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 248  0024 725f5051      	clr	20561
 249                     ; 257   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 251  0028 35405054      	mov	20564,#64
 252                     ; 258   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 254  002c c65054        	ld	a,20564
 255                     ; 259 }
 258  002f 81            	ret
 314                     ; 269 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 314                     ; 270 {
 315                     	switch	.text
 316  0030               _FLASH_Unlock:
 318  0030 88            	push	a
 319       00000000      OFST:	set	0
 322                     ; 272   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 324                     ; 275   if (FLASH_MemType == FLASH_MemType_Program)
 326  0031 a1fd          	cp	a,#253
 327  0033 2608          	jrne	L731
 328                     ; 277     FLASH->PUKR = FLASH_RASS_KEY1;
 330  0035 35565052      	mov	20562,#86
 331                     ; 278     FLASH->PUKR = FLASH_RASS_KEY2;
 333  0039 35ae5052      	mov	20562,#174
 334  003d               L731:
 335                     ; 282   if (FLASH_MemType == FLASH_MemType_Data)
 337  003d 7b01          	ld	a,(OFST+1,sp)
 338  003f a1f7          	cp	a,#247
 339  0041 2608          	jrne	L141
 340                     ; 284     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 342  0043 35ae5053      	mov	20563,#174
 343                     ; 285     FLASH->DUKR = FLASH_RASS_KEY1;
 345  0047 35565053      	mov	20563,#86
 346  004b               L141:
 347                     ; 287 }
 350  004b 84            	pop	a
 351  004c 81            	ret
 386                     ; 297 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 386                     ; 298 {
 387                     	switch	.text
 388  004d               _FLASH_Lock:
 392                     ; 300   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 394                     ; 302   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 396  004d c45054        	and	a,20564
 397  0050 c75054        	ld	20564,a
 398                     ; 303 }
 401  0053 81            	ret
 444                     ; 311 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 444                     ; 312 {
 445                     	switch	.text
 446  0054               _FLASH_ProgramByte:
 448       00000000      OFST:	set	0
 451                     ; 314   assert_param(IS_FLASH_ADDRESS(Address));
 453                     ; 316   *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 455  0054 7b07          	ld	a,(OFST+7,sp)
 456  0056 1e05          	ldw	x,(OFST+5,sp)
 457  0058 f7            	ld	(x),a
 458                     ; 317 }
 461  0059 81            	ret
 495                     ; 324 void FLASH_EraseByte(uint32_t Address)
 495                     ; 325 {
 496                     	switch	.text
 497  005a               _FLASH_EraseByte:
 499       00000000      OFST:	set	0
 502                     ; 327   assert_param(IS_FLASH_ADDRESS(Address));
 504                     ; 329   *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 506  005a 1e05          	ldw	x,(OFST+5,sp)
 507  005c 7f            	clr	(x)
 508                     ; 330 }
 511  005d 81            	ret
 554                     ; 338 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 554                     ; 339 {
 555                     	switch	.text
 556  005e               _FLASH_ProgramWord:
 558       00000000      OFST:	set	0
 561                     ; 341   assert_param(IS_FLASH_ADDRESS(Address));
 563                     ; 343   FLASH->CR2 |= FLASH_CR2_WPRG;
 565  005e 721c5051      	bset	20561,#6
 566                     ; 346   *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));   
 568  0062 7b07          	ld	a,(OFST+7,sp)
 569  0064 1e05          	ldw	x,(OFST+5,sp)
 570  0066 f7            	ld	(x),a
 571                     ; 348   *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data) + 1);
 573  0067 7b08          	ld	a,(OFST+8,sp)
 574  0069 1e05          	ldw	x,(OFST+5,sp)
 575  006b e701          	ld	(1,x),a
 576                     ; 350   *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 578  006d 7b09          	ld	a,(OFST+9,sp)
 579  006f 1e05          	ldw	x,(OFST+5,sp)
 580  0071 e702          	ld	(2,x),a
 581                     ; 352   *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 583  0073 7b0a          	ld	a,(OFST+10,sp)
 584  0075 1e05          	ldw	x,(OFST+5,sp)
 585  0077 e703          	ld	(3,x),a
 586                     ; 353 }
 589  0079 81            	ret
 623                     ; 360 uint8_t FLASH_ReadByte(uint32_t Address)
 623                     ; 361 {
 624                     	switch	.text
 625  007a               _FLASH_ReadByte:
 627       00000000      OFST:	set	0
 630                     ; 363   return(*(PointerAttr uint8_t *) (uint16_t)Address);
 632  007a 1e05          	ldw	x,(OFST+5,sp)
 633  007c f6            	ld	a,(x)
 636  007d 81            	ret
 681                     ; 410 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 681                     ; 411 {
 682                     	switch	.text
 683  007e               _FLASH_ProgramOptionByte:
 685  007e 89            	pushw	x
 686       00000000      OFST:	set	0
 689                     ; 413   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 691                     ; 416   FLASH->CR2 |= FLASH_CR2_OPT;
 693  007f 721e5051      	bset	20561,#7
 694                     ; 419   *((PointerAttr uint8_t*)Address) = Data;
 696  0083 7b05          	ld	a,(OFST+5,sp)
 697  0085 1e01          	ldw	x,(OFST+1,sp)
 698  0087 f7            	ld	(x),a
 699                     ; 421   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 701  0088 a6fd          	ld	a,#253
 702  008a cd00b9        	call	_FLASH_WaitForLastOperation
 704                     ; 424   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 706  008d 721f5051      	bres	20561,#7
 707                     ; 425 }
 710  0091 85            	popw	x
 711  0092 81            	ret
 747                     ; 432 void FLASH_EraseOptionByte(uint16_t Address)
 747                     ; 433 {
 748                     	switch	.text
 749  0093               _FLASH_EraseOptionByte:
 753                     ; 435   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 755                     ; 438   FLASH->CR2 |= FLASH_CR2_OPT;
 757  0093 721e5051      	bset	20561,#7
 758                     ; 441   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 760  0097 7f            	clr	(x)
 761                     ; 443   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 763  0098 a6fd          	ld	a,#253
 764  009a cd00b9        	call	_FLASH_WaitForLastOperation
 766                     ; 446   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 768  009d 721f5051      	bres	20561,#7
 769                     ; 447 }
 772  00a1 81            	ret
 829                     ; 455 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 829                     ; 456 {
 830                     	switch	.text
 831  00a2               _FLASH_GetReadOutProtectionStatus:
 833  00a2 88            	push	a
 834       00000001      OFST:	set	1
 837                     ; 457   FunctionalState state = DISABLE;
 839                     ; 459   if (OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 841  00a3 c64800        	ld	a,18432
 842  00a6 a1aa          	cp	a,#170
 843  00a8 2606          	jrne	L743
 844                     ; 462     state =  ENABLE;
 846  00aa a601          	ld	a,#1
 847  00ac 6b01          	ld	(OFST+0,sp),a
 850  00ae 2002          	jra	L153
 851  00b0               L743:
 852                     ; 467     state =  DISABLE;
 854  00b0 0f01          	clr	(OFST+0,sp)
 856  00b2               L153:
 857                     ; 470   return state;
 859  00b2 7b01          	ld	a,(OFST+0,sp)
 862  00b4 5b01          	addw	sp,#1
 863  00b6 81            	ret
 897                     ; 478 uint16_t FLASH_GetBootSize(void)
 897                     ; 479 {
 898                     	switch	.text
 899  00b7               _FLASH_GetBootSize:
 901  00b7 89            	pushw	x
 902       00000002      OFST:	set	2
 905                     ; 480   uint16_t temp = 0;
 907                     ; 483   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 909  00b8 c64802        	ld	a,18434
 910  00bb 5f            	clrw	x
 911  00bc 97            	ld	xl,a
 912  00bd 4f            	clr	a
 913  00be 02            	rlwa	x,a
 914  00bf 44            	srl	a
 915  00c0 56            	rrcw	x
 916  00c1 1f01          	ldw	(OFST-1,sp),x
 918                     ; 486   if (OPT->UBC > 0x7F)
 920  00c3 c64802        	ld	a,18434
 921  00c6 a180          	cp	a,#128
 922  00c8 2505          	jrult	L173
 923                     ; 488     temp = 8192;
 925  00ca ae2000        	ldw	x,#8192
 926  00cd 1f01          	ldw	(OFST-1,sp),x
 928  00cf               L173:
 929                     ; 492   return(temp);
 931  00cf 1e01          	ldw	x,(OFST-1,sp)
 934  00d1 5b02          	addw	sp,#2
 935  00d3 81            	ret
 969                     ; 502 uint16_t FLASH_GetCodeSize(void)
 969                     ; 503 {
 970                     	switch	.text
 971  00d4               _FLASH_GetCodeSize:
 973  00d4 89            	pushw	x
 974       00000002      OFST:	set	2
 977                     ; 504   uint16_t temp = 0;
 979                     ; 507   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 981  00d5 c64807        	ld	a,18439
 982  00d8 5f            	clrw	x
 983  00d9 97            	ld	xl,a
 984  00da 4f            	clr	a
 985  00db 02            	rlwa	x,a
 986  00dc 44            	srl	a
 987  00dd 56            	rrcw	x
 988  00de 1f01          	ldw	(OFST-1,sp),x
 990                     ; 510   if (OPT->PCODESIZE > 0x7F)
 992  00e0 c64807        	ld	a,18439
 993  00e3 a180          	cp	a,#128
 994  00e5 2505          	jrult	L114
 995                     ; 512     temp = 8192;
 997  00e7 ae2000        	ldw	x,#8192
 998  00ea 1f01          	ldw	(OFST-1,sp),x
1000  00ec               L114:
1001                     ; 516   return(temp);
1003  00ec 1e01          	ldw	x,(OFST-1,sp)
1006  00ee 5b02          	addw	sp,#2
1007  00f0 81            	ret
1042                     ; 541 void FLASH_ITConfig(FunctionalState NewState)
1042                     ; 542 {
1043                     	switch	.text
1044  00f1               _FLASH_ITConfig:
1048                     ; 545   assert_param(IS_FUNCTIONAL_STATE(NewState));
1050                     ; 547   if (NewState != DISABLE)
1052  00f1 4d            	tnz	a
1053  00f2 2706          	jreq	L134
1054                     ; 550     FLASH->CR1 |= FLASH_CR1_IE;
1056  00f4 72125050      	bset	20560,#1
1058  00f8 2004          	jra	L334
1059  00fa               L134:
1060                     ; 555     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1062  00fa 72135050      	bres	20560,#1
1063  00fe               L334:
1064                     ; 557 }
1067  00fe 81            	ret
1176                     ; 571 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1176                     ; 572 {
1177                     	switch	.text
1178  00ff               _FLASH_GetFlagStatus:
1180  00ff 88            	push	a
1181       00000001      OFST:	set	1
1184                     ; 573   FlagStatus status = RESET;
1186                     ; 574   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1188                     ; 577   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1190  0100 c45054        	and	a,20564
1191  0103 2706          	jreq	L505
1192                     ; 579     status = SET; /* Flash_FLAG is set*/
1194  0105 a601          	ld	a,#1
1195  0107 6b01          	ld	(OFST+0,sp),a
1198  0109 2002          	jra	L705
1199  010b               L505:
1200                     ; 583     status = RESET; /* Flash_FLAG is reset*/
1202  010b 0f01          	clr	(OFST+0,sp)
1204  010d               L705:
1205                     ; 587   return status;
1207  010d 7b01          	ld	a,(OFST+0,sp)
1210  010f 5b01          	addw	sp,#1
1211  0111 81            	ret
1247                     ; 703 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1247                     ; 704 {
1248                     .FLASH_CODE:	section	.text
1249  0000               _FLASH_PowerRunModeConfig:
1253                     ; 706   assert_param(IS_FLASH_POWER(FLASH_Power));
1255                     ; 708   if (FLASH_Power != FLASH_Power_On)
1257  0000 a101          	cp	a,#1
1258  0002 2706          	jreq	L725
1259                     ; 710   FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1261  0004 72165050      	bset	20560,#3
1263  0008 2004          	jra	L135
1264  000a               L725:
1265                     ; 714     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1267  000a 72175050      	bres	20560,#3
1268  000e               L135:
1269                     ; 716 }
1272  000e 81            	ret
1336                     ; 729 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1336                     ; 730 {
1337                     	switch	.FLASH_CODE
1338  000f               _FLASH_GetPowerStatus:
1342                     ; 731   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1344  000f c65050        	ld	a,20560
1345  0012 a40c          	and	a,#12
1348  0014 81            	ret
1452                     ; 749 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1452                     ; 750                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1452                     ; 751 {
1453                     	switch	.FLASH_CODE
1454  0015               _FLASH_ProgramBlock:
1456  0015 89            	pushw	x
1457  0016 5206          	subw	sp,#6
1458       00000006      OFST:	set	6
1461                     ; 752   uint16_t Count = 0;
1463                     ; 753   uint32_t startaddress = 0;
1465                     ; 756   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1467                     ; 757   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1469                     ; 758   if (FLASH_MemType == FLASH_MemType_Program)
1471  0018 7b0b          	ld	a,(OFST+5,sp)
1472  001a a1fd          	cp	a,#253
1473  001c 260c          	jrne	L136
1474                     ; 760   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1476                     ; 761     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1478  001e ae8000        	ldw	x,#32768
1479  0021 1f03          	ldw	(OFST-3,sp),x
1480  0023 ae0000        	ldw	x,#0
1481  0026 1f01          	ldw	(OFST-5,sp),x
1484  0028 200a          	jra	L336
1485  002a               L136:
1486                     ; 765     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1488                     ; 766     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1490  002a ae1000        	ldw	x,#4096
1491  002d 1f03          	ldw	(OFST-3,sp),x
1492  002f ae0000        	ldw	x,#0
1493  0032 1f01          	ldw	(OFST-5,sp),x
1495  0034               L336:
1496                     ; 770   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1498  0034 1e07          	ldw	x,(OFST+1,sp)
1499  0036 a680          	ld	a,#128
1500  0038 cd0000        	call	c_cmulx
1502  003b 96            	ldw	x,sp
1503  003c 1c0001        	addw	x,#OFST-5
1504  003f cd0000        	call	c_lgadd
1507                     ; 773   if (FLASH_ProgMode == FLASH_ProgramMode_Standard)
1509  0042 0d0c          	tnz	(OFST+6,sp)
1510  0044 2606          	jrne	L536
1511                     ; 776   FLASH->CR2 |= FLASH_CR2_PRG;
1513  0046 72105051      	bset	20561,#0
1515  004a 2004          	jra	L736
1516  004c               L536:
1517                     ; 781   FLASH->CR2 |= FLASH_CR2_FPRG;
1519  004c 72185051      	bset	20561,#4
1520  0050               L736:
1521                     ; 785   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1523  0050 5f            	clrw	x
1524  0051 1f05          	ldw	(OFST-1,sp),x
1526  0053               L146:
1527                     ; 788   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1529  0053 1e0d          	ldw	x,(OFST+7,sp)
1530  0055 72fb05        	addw	x,(OFST-1,sp)
1531  0058 f6            	ld	a,(x)
1532  0059 1e03          	ldw	x,(OFST-3,sp)
1533  005b 72fb05        	addw	x,(OFST-1,sp)
1534  005e f7            	ld	(x),a
1535                     ; 785   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1537  005f 1e05          	ldw	x,(OFST-1,sp)
1538  0061 1c0001        	addw	x,#1
1539  0064 1f05          	ldw	(OFST-1,sp),x
1543  0066 1e05          	ldw	x,(OFST-1,sp)
1544  0068 a30080        	cpw	x,#128
1545  006b 25e6          	jrult	L146
1546                     ; 793 }
1549  006d 5b08          	addw	sp,#8
1550  006f 81            	ret
1613                     ; 805 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1613                     ; 806 {
1614                     	switch	.FLASH_CODE
1615  0070               _FLASH_EraseBlock:
1617  0070 89            	pushw	x
1618  0071 5206          	subw	sp,#6
1619       00000006      OFST:	set	6
1622                     ; 807   uint32_t startaddress = 0;
1624                     ; 815   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1626                     ; 816   if (FLASH_MemType == FLASH_MemType_Program)
1628  0073 7b0b          	ld	a,(OFST+5,sp)
1629  0075 a1fd          	cp	a,#253
1630  0077 260c          	jrne	L107
1631                     ; 818   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1633                     ; 819     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1635  0079 ae8000        	ldw	x,#32768
1636  007c 1f05          	ldw	(OFST-1,sp),x
1637  007e ae0000        	ldw	x,#0
1638  0081 1f03          	ldw	(OFST-3,sp),x
1641  0083 200a          	jra	L307
1642  0085               L107:
1643                     ; 823     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1645                     ; 824     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1647  0085 ae1000        	ldw	x,#4096
1648  0088 1f05          	ldw	(OFST-1,sp),x
1649  008a ae0000        	ldw	x,#0
1650  008d 1f03          	ldw	(OFST-3,sp),x
1652  008f               L307:
1653                     ; 829   pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1655  008f 1e07          	ldw	x,(OFST+1,sp)
1656  0091 a680          	ld	a,#128
1657  0093 cd0000        	call	c_cmulx
1659  0096 96            	ldw	x,sp
1660  0097 1c0003        	addw	x,#OFST-3
1661  009a cd0000        	call	c_ladd
1663  009d be02          	ldw	x,c_lreg+2
1664  009f 1f01          	ldw	(OFST-5,sp),x
1666                     ; 835   FLASH->CR2 |= FLASH_CR2_ERASE;
1668  00a1 721a5051      	bset	20561,#5
1669                     ; 838   *pwFlash = (uint32_t)0;
1671  00a5 1e01          	ldw	x,(OFST-5,sp)
1672  00a7 a600          	ld	a,#0
1673  00a9 e703          	ld	(3,x),a
1674  00ab a600          	ld	a,#0
1675  00ad e702          	ld	(2,x),a
1676  00af a600          	ld	a,#0
1677  00b1 e701          	ld	(1,x),a
1678  00b3 a600          	ld	a,#0
1679  00b5 f7            	ld	(x),a
1680                     ; 845 }
1683  00b6 5b08          	addw	sp,#8
1684  00b8 81            	ret
1769                     ; 857 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1769                     ; 858 {
1770                     	switch	.FLASH_CODE
1771  00b9               _FLASH_WaitForLastOperation:
1773  00b9 5205          	subw	sp,#5
1774       00000005      OFST:	set	5
1777                     ; 859   uint32_t timeout = OPERATION_TIMEOUT;
1779  00bb aeffff        	ldw	x,#65535
1780  00be 1f03          	ldw	(OFST-2,sp),x
1781  00c0 ae0000        	ldw	x,#0
1782  00c3 1f01          	ldw	(OFST-4,sp),x
1784                     ; 860   uint8_t flagstatus = 0x00;
1786  00c5 0f05          	clr	(OFST+0,sp)
1788                     ; 862   if (FLASH_MemType == FLASH_MemType_Program)
1790  00c7 a1fd          	cp	a,#253
1791  00c9 2631          	jrne	L367
1793  00cb 2010          	jra	L157
1794  00cd               L747:
1795                     ; 866       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1795                     ; 867                              FLASH_IAPSR_WR_PG_DIS));
1797  00cd c65054        	ld	a,20564
1798  00d0 a405          	and	a,#5
1799  00d2 6b05          	ld	(OFST+0,sp),a
1801                     ; 868       timeout--;
1803  00d4 96            	ldw	x,sp
1804  00d5 1c0001        	addw	x,#OFST-4
1805  00d8 a601          	ld	a,#1
1806  00da cd0000        	call	c_lgsbc
1809  00dd               L157:
1810                     ; 864   while ((flagstatus == 0x00) && (timeout != 0x00))
1812  00dd 0d05          	tnz	(OFST+0,sp)
1813  00df 2628          	jrne	L757
1815  00e1 96            	ldw	x,sp
1816  00e2 1c0001        	addw	x,#OFST-4
1817  00e5 cd0000        	call	c_lzmp
1819  00e8 26e3          	jrne	L747
1820  00ea 201d          	jra	L757
1821  00ec               L167:
1822                     ; 875       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1822                     ; 876                              FLASH_IAPSR_WR_PG_DIS));
1824  00ec c65054        	ld	a,20564
1825  00ef a441          	and	a,#65
1826  00f1 6b05          	ld	(OFST+0,sp),a
1828                     ; 877       timeout--;
1830  00f3 96            	ldw	x,sp
1831  00f4 1c0001        	addw	x,#OFST-4
1832  00f7 a601          	ld	a,#1
1833  00f9 cd0000        	call	c_lgsbc
1836  00fc               L367:
1837                     ; 873     while ((flagstatus == 0x00) && (timeout != 0x00))
1839  00fc 0d05          	tnz	(OFST+0,sp)
1840  00fe 2609          	jrne	L757
1842  0100 96            	ldw	x,sp
1843  0101 1c0001        	addw	x,#OFST-4
1844  0104 cd0000        	call	c_lzmp
1846  0107 26e3          	jrne	L167
1847  0109               L757:
1848                     ; 880   if (timeout == 0x00 )
1850  0109 96            	ldw	x,sp
1851  010a 1c0001        	addw	x,#OFST-4
1852  010d cd0000        	call	c_lzmp
1854  0110 2604          	jrne	L177
1855                     ; 882   flagstatus = FLASH_Status_TimeOut;
1857  0112 a602          	ld	a,#2
1858  0114 6b05          	ld	(OFST+0,sp),a
1860  0116               L177:
1861                     ; 885   return((FLASH_Status_TypeDef)flagstatus);
1863  0116 7b05          	ld	a,(OFST+0,sp)
1866  0118 5b05          	addw	sp,#5
1867  011a 81            	ret
1880                     	xdef	_FLASH_WaitForLastOperation
1881                     	xdef	_FLASH_EraseBlock
1882                     	xdef	_FLASH_ProgramBlock
1883                     	xdef	_FLASH_GetPowerStatus
1884                     	xdef	_FLASH_PowerRunModeConfig
1885                     	xdef	_FLASH_GetFlagStatus
1886                     	xdef	_FLASH_ITConfig
1887                     	xdef	_FLASH_EraseOptionByte
1888                     	xdef	_FLASH_ProgramOptionByte
1889                     	xdef	_FLASH_GetReadOutProtectionStatus
1890                     	xdef	_FLASH_GetCodeSize
1891                     	xdef	_FLASH_GetBootSize
1892                     	xdef	_FLASH_ReadByte
1893                     	xdef	_FLASH_ProgramWord
1894                     	xdef	_FLASH_EraseByte
1895                     	xdef	_FLASH_ProgramByte
1896                     	xdef	_FLASH_Lock
1897                     	xdef	_FLASH_Unlock
1898                     	xdef	_FLASH_DeInit
1899                     	xdef	_FLASH_PowerWaitModeConfig
1900                     	xdef	_FLASH_SetProgrammingTime
1901                     	xdef	_FLASH_GetProgrammingTime
1902                     	xref.b	c_lreg
1921                     	xref	c_lzmp
1922                     	xref	c_lgsbc
1923                     	xref	c_ladd
1924                     	xref	c_lgadd
1925                     	xref	c_cmulx
1926                     	end
