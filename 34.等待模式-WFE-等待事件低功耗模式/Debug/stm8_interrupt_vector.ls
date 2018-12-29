   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  14                     .const:	section	.text
  15  0000               __vectab:
  16  0000 82            	dc.b	130
  18  0001 00            	dc.b	page(__stext)
  19  0002 0000          	dc.w	__stext
  20  0004 82            	dc.b	130
  22  0005 00            	dc.b	page(f_TRAP_IRQHandler)
  23  0006 0000          	dc.w	f_TRAP_IRQHandler
  24  0008 82            	dc.b	130
  26  0009 00            	dc.b	page(f_NonHandledInterrupt)
  27  000a 0000          	dc.w	f_NonHandledInterrupt
  28  000c 82            	dc.b	130
  30  000d 00            	dc.b	page(f_FLASH_IRQHandler)
  31  000e 0000          	dc.w	f_FLASH_IRQHandler
  32  0010 82            	dc.b	130
  34  0011 00            	dc.b	page(f_DMA1_CHANNEL0_1_IRQHandler)
  35  0012 0000          	dc.w	f_DMA1_CHANNEL0_1_IRQHandler
  36  0014 82            	dc.b	130
  38  0015 00            	dc.b	page(f_DMA1_CHANNEL2_3_IRQHandler)
  39  0016 0000          	dc.w	f_DMA1_CHANNEL2_3_IRQHandler
  40  0018 82            	dc.b	130
  42  0019 00            	dc.b	page(f_RTC_CSSLSE_IRQHandler)
  43  001a 0000          	dc.w	f_RTC_CSSLSE_IRQHandler
  44  001c 82            	dc.b	130
  46  001d 00            	dc.b	page(f_EXTIE_F_PVD_IRQHandler)
  47  001e 0000          	dc.w	f_EXTIE_F_PVD_IRQHandler
  48  0020 82            	dc.b	130
  50  0021 00            	dc.b	page(f_EXTIB_G_IRQHandler)
  51  0022 0000          	dc.w	f_EXTIB_G_IRQHandler
  52  0024 82            	dc.b	130
  54  0025 00            	dc.b	page(f_EXTID_H_IRQHandler)
  55  0026 0000          	dc.w	f_EXTID_H_IRQHandler
  56  0028 82            	dc.b	130
  58  0029 00            	dc.b	page(f_EXTI0_IRQHandler)
  59  002a 0000          	dc.w	f_EXTI0_IRQHandler
  60  002c 82            	dc.b	130
  62  002d 00            	dc.b	page(f_EXTI1_IRQHandler)
  63  002e 0000          	dc.w	f_EXTI1_IRQHandler
  64  0030 82            	dc.b	130
  66  0031 00            	dc.b	page(f_EXTI2_IRQHandler)
  67  0032 0000          	dc.w	f_EXTI2_IRQHandler
  68  0034 82            	dc.b	130
  70  0035 00            	dc.b	page(f_EXTI3_IRQHandler)
  71  0036 0000          	dc.w	f_EXTI3_IRQHandler
  72  0038 82            	dc.b	130
  74  0039 00            	dc.b	page(f_EXTI4_IRQHandler)
  75  003a 0000          	dc.w	f_EXTI4_IRQHandler
  76  003c 82            	dc.b	130
  78  003d 00            	dc.b	page(f_EXTI5_IRQHandler)
  79  003e 0000          	dc.w	f_EXTI5_IRQHandler
  80  0040 82            	dc.b	130
  82  0041 00            	dc.b	page(f_EXTI6_IRQHandler)
  83  0042 0000          	dc.w	f_EXTI6_IRQHandler
  84  0044 82            	dc.b	130
  86  0045 00            	dc.b	page(f_EXTI7_IRQHandler)
  87  0046 0000          	dc.w	f_EXTI7_IRQHandler
  88  0048 82            	dc.b	130
  90  0049 00            	dc.b	page(f_LCD_AES_IRQHandler)
  91  004a 0000          	dc.w	f_LCD_AES_IRQHandler
  92  004c 82            	dc.b	130
  94  004d 00            	dc.b	page(f_SWITCH_CSS_BREAK_DAC_IRQHandler)
  95  004e 0000          	dc.w	f_SWITCH_CSS_BREAK_DAC_IRQHandler
  96  0050 82            	dc.b	130
  98  0051 00            	dc.b	page(f_ADC1_COMP_IRQHandler)
  99  0052 0000          	dc.w	f_ADC1_COMP_IRQHandler
 100  0054 82            	dc.b	130
 102  0055 00            	dc.b	page(f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler)
 103  0056 0000          	dc.w	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 104  0058 82            	dc.b	130
 106  0059 00            	dc.b	page(f_TIM2_CC_USART2_RX_IRQHandler)
 107  005a 0000          	dc.w	f_TIM2_CC_USART2_RX_IRQHandler
 108  005c 82            	dc.b	130
 110  005d 00            	dc.b	page(f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler)
 111  005e 0000          	dc.w	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 112  0060 82            	dc.b	130
 114  0061 00            	dc.b	page(f_TIM3_CC_USART3_RX_IRQHandler)
 115  0062 0000          	dc.w	f_TIM3_CC_USART3_RX_IRQHandler
 116  0064 82            	dc.b	130
 118  0065 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_COM_IRQHandler)
 119  0066 0000          	dc.w	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 120  0068 82            	dc.b	130
 122  0069 00            	dc.b	page(f_TIM1_CC_IRQHandler)
 123  006a 0000          	dc.w	f_TIM1_CC_IRQHandler
 124  006c 82            	dc.b	130
 126  006d 00            	dc.b	page(f_TIM4_UPD_OVF_TRG_IRQHandler)
 127  006e 0000          	dc.w	f_TIM4_UPD_OVF_TRG_IRQHandler
 128  0070 82            	dc.b	130
 130  0071 00            	dc.b	page(f_SPI1_IRQHandler)
 131  0072 0000          	dc.w	f_SPI1_IRQHandler
 132  0074 82            	dc.b	130
 134  0075 00            	dc.b	page(f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler)
 135  0076 0000          	dc.w	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 136  0078 82            	dc.b	130
 138  0079 00            	dc.b	page(f_USART1_RX_TIM5_CC_IRQHandler)
 139  007a 0000          	dc.w	f_USART1_RX_TIM5_CC_IRQHandler
 140  007c 82            	dc.b	130
 142  007d 00            	dc.b	page(f_I2C1_SPI2_IRQHandler)
 143  007e 0000          	dc.w	f_I2C1_SPI2_IRQHandler
 203                     	xdef	__vectab
 204                     	xref	f_I2C1_SPI2_IRQHandler
 205                     	xref	f_USART1_RX_TIM5_CC_IRQHandler
 206                     	xref	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 207                     	xref	f_SPI1_IRQHandler
 208                     	xref	f_TIM4_UPD_OVF_TRG_IRQHandler
 209                     	xref	f_TIM1_CC_IRQHandler
 210                     	xref	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 211                     	xref	f_TIM3_CC_USART3_RX_IRQHandler
 212                     	xref	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 213                     	xref	f_TIM2_CC_USART2_RX_IRQHandler
 214                     	xref	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 215                     	xref	f_ADC1_COMP_IRQHandler
 216                     	xref	f_SWITCH_CSS_BREAK_DAC_IRQHandler
 217                     	xref	f_LCD_AES_IRQHandler
 218                     	xref	f_EXTI7_IRQHandler
 219                     	xref	f_EXTI6_IRQHandler
 220                     	xref	f_EXTI5_IRQHandler
 221                     	xref	f_EXTI4_IRQHandler
 222                     	xref	f_EXTI3_IRQHandler
 223                     	xref	f_EXTI2_IRQHandler
 224                     	xref	f_EXTI1_IRQHandler
 225                     	xref	f_EXTI0_IRQHandler
 226                     	xref	f_EXTID_H_IRQHandler
 227                     	xref	f_EXTIB_G_IRQHandler
 228                     	xref	f_EXTIE_F_PVD_IRQHandler
 229                     	xref	f_RTC_CSSLSE_IRQHandler
 230                     	xref	f_DMA1_CHANNEL2_3_IRQHandler
 231                     	xref	f_DMA1_CHANNEL0_1_IRQHandler
 232                     	xref	f_FLASH_IRQHandler
 233                     	xref	f_TRAP_IRQHandler
 234                     	xref	f_NonHandledInterrupt
 235                     	xref	__stext
 254                     	end
