   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  52                     ; 113 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  52                     ; 114 {
  54                     	switch	.text
  55  0000               _WWDG_Init:
  57  0000 89            	pushw	x
  58       00000000      OFST:	set	0
  61                     ; 116   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  63                     ; 118   WWDG->WR = WWDG_WR_RESET_VALUE;
  65  0001 357f50d4      	mov	20692,#127
  66                     ; 119   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  68  0005 9e            	ld	a,xh
  69  0006 aa80          	or	a,#128
  70  0008 c750d3        	ld	20691,a
  71                     ; 120   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  73  000b 7b02          	ld	a,(OFST+2,sp)
  74  000d a47f          	and	a,#127
  75  000f c750d4        	ld	20692,a
  76                     ; 121 }
  79  0012 85            	popw	x
  80  0013 81            	ret
 124                     ; 129 void WWDG_SetWindowValue(uint8_t WindowValue)
 124                     ; 130 {
 125                     	switch	.text
 126  0014               _WWDG_SetWindowValue:
 128  0014 88            	push	a
 129       00000001      OFST:	set	1
 132                     ; 131   __IO uint8_t tmpreg = 0;
 134  0015 0f01          	clr	(OFST+0,sp)
 135                     ; 134   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 137                     ; 137   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 139  0017 a47f          	and	a,#127
 140  0019 1a01          	or	a,(OFST+0,sp)
 141  001b 6b01          	ld	(OFST+0,sp),a
 142                     ; 140   WWDG->WR = tmpreg;
 144  001d 7b01          	ld	a,(OFST+0,sp)
 145  001f c750d4        	ld	20692,a
 146                     ; 141 }
 149  0022 84            	pop	a
 150  0023 81            	ret
 184                     ; 150 void WWDG_SetCounter(uint8_t Counter)
 184                     ; 151 {
 185                     	switch	.text
 186  0024               _WWDG_SetCounter:
 190                     ; 153   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 192                     ; 157   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 194  0024 a47f          	and	a,#127
 195  0026 c750d3        	ld	20691,a
 196                     ; 158 }
 199  0029 81            	ret
 233                     ; 181 void WWDG_Enable(uint8_t Counter)
 233                     ; 182 {
 234                     	switch	.text
 235  002a               _WWDG_Enable:
 239                     ; 184   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 241                     ; 185   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 243  002a aa80          	or	a,#128
 244  002c c750d3        	ld	20691,a
 245                     ; 186 }
 248  002f 81            	ret
 271                     ; 210 uint8_t WWDG_GetCounter(void)
 271                     ; 211 {
 272                     	switch	.text
 273  0030               _WWDG_GetCounter:
 277                     ; 212   return(WWDG->CR);
 279  0030 c650d3        	ld	a,20691
 282  0033 81            	ret
 305                     ; 220 void WWDG_SWReset(void)
 305                     ; 221 {
 306                     	switch	.text
 307  0034               _WWDG_SWReset:
 311                     ; 222   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 313  0034 358050d3      	mov	20691,#128
 314                     ; 223 }
 317  0038 81            	ret
 330                     	xdef	_WWDG_SWReset
 331                     	xdef	_WWDG_GetCounter
 332                     	xdef	_WWDG_Enable
 333                     	xdef	_WWDG_SetCounter
 334                     	xdef	_WWDG_SetWindowValue
 335                     	xdef	_WWDG_Init
 354                     	end
