   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 86 void BEEP_DeInit(void)
  32                     ; 87 {
  34                     	switch	.text
  35  0000               _BEEP_DeInit:
  39                     ; 88   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  41  0000 725f50f0      	clr	20720
  42                     ; 89   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  44  0004 351f50f3      	mov	20723,#31
  45                     ; 90 }
  48  0008 81            	ret
 113                     ; 99 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 113                     ; 100 {
 114                     	switch	.text
 115  0009               _BEEP_Init:
 117  0009 88            	push	a
 118       00000000      OFST:	set	0
 121                     ; 103   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 123                     ; 106   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 125  000a c650f3        	ld	a,20723
 126  000d a41f          	and	a,#31
 127  000f a11f          	cp	a,#31
 128  0011 260c          	jrne	L15
 129                     ; 108     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 131  0013 c650f3        	ld	a,20723
 132  0016 a4e0          	and	a,#224
 133  0018 c750f3        	ld	20723,a
 134                     ; 109     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 136  001b 721050f3      	bset	20723,#0
 137  001f               L15:
 138                     ; 113   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 140  001f c650f3        	ld	a,20723
 141  0022 a43f          	and	a,#63
 142  0024 c750f3        	ld	20723,a
 143                     ; 114   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 145  0027 c650f3        	ld	a,20723
 146  002a 1a01          	or	a,(OFST+1,sp)
 147  002c c750f3        	ld	20723,a
 148                     ; 116 }
 151  002f 84            	pop	a
 152  0030 81            	ret
 207                     ; 124 void BEEP_Cmd(FunctionalState NewState)
 207                     ; 125 {
 208                     	switch	.text
 209  0031               _BEEP_Cmd:
 213                     ; 127   assert_param(IS_FUNCTIONAL_STATE(NewState));
 215                     ; 129   if (NewState != DISABLE)
 217  0031 4d            	tnz	a
 218  0032 2706          	jreq	L101
 219                     ; 132     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 221  0034 721a50f3      	bset	20723,#5
 223  0038 2004          	jra	L301
 224  003a               L101:
 225                     ; 137     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 227  003a 721b50f3      	bres	20723,#5
 228  003e               L301:
 229                     ; 139 }
 232  003e 81            	ret
 268                     ; 172 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 268                     ; 173 {
 269                     	switch	.text
 270  003f               _BEEP_LSClockToTIMConnectCmd:
 274                     ; 175   assert_param(IS_FUNCTIONAL_STATE(NewState));
 276                     ; 177   if (NewState != DISABLE)
 278  003f 4d            	tnz	a
 279  0040 2706          	jreq	L321
 280                     ; 180     BEEP->CSR1 |= BEEP_CSR1_MSR;
 282  0042 721050f0      	bset	20720,#0
 284  0046 2004          	jra	L521
 285  0048               L321:
 286                     ; 185     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 288  0048 721150f0      	bres	20720,#0
 289  004c               L521:
 290                     ; 187 }
 293  004c 81            	ret
 346                     .const:	section	.text
 347  0000               L61:
 348  0000 000003e8      	dc.l	1000
 349                     ; 201 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 349                     ; 202 {
 350                     	switch	.text
 351  004d               _BEEP_LSICalibrationConfig:
 353  004d 5206          	subw	sp,#6
 354       00000006      OFST:	set	6
 357                     ; 207   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 359                     ; 209   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 361  004f 96            	ldw	x,sp
 362  0050 1c0009        	addw	x,#OFST+3
 363  0053 cd0000        	call	c_ltor
 365  0056 ae0000        	ldw	x,#L61
 366  0059 cd0000        	call	c_ludv
 368  005c be02          	ldw	x,c_lreg+2
 369  005e 1f03          	ldw	(OFST-3,sp),x
 370                     ; 213   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 372  0060 c650f3        	ld	a,20723
 373  0063 a4e0          	and	a,#224
 374  0065 c750f3        	ld	20723,a
 375                     ; 215   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 377  0068 1e03          	ldw	x,(OFST-3,sp)
 378  006a 54            	srlw	x
 379  006b 54            	srlw	x
 380  006c 54            	srlw	x
 381  006d 1f05          	ldw	(OFST-1,sp),x
 382                     ; 217   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 384  006f 1e05          	ldw	x,(OFST-1,sp)
 385  0071 58            	sllw	x
 386  0072 58            	sllw	x
 387  0073 58            	sllw	x
 388  0074 1f01          	ldw	(OFST-5,sp),x
 389  0076 1e03          	ldw	x,(OFST-3,sp)
 390  0078 72f001        	subw	x,(OFST-5,sp)
 391  007b 1605          	ldw	y,(OFST-1,sp)
 392  007d 9058          	sllw	y
 393  007f 905c          	incw	y
 394  0081 cd0000        	call	c_imul
 396  0084 1605          	ldw	y,(OFST-1,sp)
 397  0086 9058          	sllw	y
 398  0088 9058          	sllw	y
 399  008a 9058          	sllw	y
 400  008c bf01          	ldw	c_x+1,x
 401  008e 90b301        	cpw	y,c_x+1
 402  0091 250c          	jrult	L551
 403                     ; 219     BEEP->CSR2 |= (uint8_t)(A - 2U);
 405  0093 7b06          	ld	a,(OFST+0,sp)
 406  0095 a002          	sub	a,#2
 407  0097 ca50f3        	or	a,20723
 408  009a c750f3        	ld	20723,a
 410  009d 2009          	jra	L751
 411  009f               L551:
 412                     ; 223     BEEP->CSR2 |= (uint8_t)(A - 1U);
 414  009f 7b06          	ld	a,(OFST+0,sp)
 415  00a1 4a            	dec	a
 416  00a2 ca50f3        	or	a,20723
 417  00a5 c750f3        	ld	20723,a
 418  00a8               L751:
 419                     ; 225 }
 422  00a8 5b06          	addw	sp,#6
 423  00aa 81            	ret
 436                     	xdef	_BEEP_LSICalibrationConfig
 437                     	xdef	_BEEP_LSClockToTIMConnectCmd
 438                     	xdef	_BEEP_Cmd
 439                     	xdef	_BEEP_Init
 440                     	xdef	_BEEP_DeInit
 441                     	xref.b	c_lreg
 442                     	xref.b	c_x
 461                     	xref	c_imul
 462                     	xref	c_ludv
 463                     	xref	c_ltor
 464                     	end
