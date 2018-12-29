   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  67                     ; 122 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  67                     ; 123 {
  69                     	switch	.text
  70  0000               _IWDG_WriteAccessCmd:
  74                     ; 125   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  76                     ; 126   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  78  0000 c750e0        	ld	20704,a
  79                     ; 127 }
  82  0003 81            	ret
 172                     ; 142 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 172                     ; 143 {
 173                     	switch	.text
 174  0004               _IWDG_SetPrescaler:
 178                     ; 145   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 180                     ; 146   IWDG->PR = IWDG_Prescaler;
 182  0004 c750e1        	ld	20705,a
 183                     ; 147 }
 186  0007 81            	ret
 220                     ; 156 void IWDG_SetReload(uint8_t IWDG_Reload)
 220                     ; 157 {
 221                     	switch	.text
 222  0008               _IWDG_SetReload:
 226                     ; 158   IWDG->RLR = IWDG_Reload;
 228  0008 c750e2        	ld	20706,a
 229                     ; 159 }
 232  000b 81            	ret
 255                     ; 167 void IWDG_ReloadCounter(void)
 255                     ; 168 {
 256                     	switch	.text
 257  000c               _IWDG_ReloadCounter:
 261                     ; 169   IWDG->KR = IWDG_KEY_REFRESH;
 263  000c 35aa50e0      	mov	20704,#170
 264                     ; 170 }
 267  0010 81            	ret
 290                     ; 193 void IWDG_Enable(void)
 290                     ; 194 {
 291                     	switch	.text
 292  0011               _IWDG_Enable:
 296                     ; 195   IWDG->KR = IWDG_KEY_ENABLE;
 298  0011 35cc50e0      	mov	20704,#204
 299                     ; 196 }
 302  0015 81            	ret
 315                     	xdef	_IWDG_Enable
 316                     	xdef	_IWDG_ReloadCounter
 317                     	xdef	_IWDG_SetReload
 318                     	xdef	_IWDG_SetPrescaler
 319                     	xdef	_IWDG_WriteAccessCmd
 338                     	end
