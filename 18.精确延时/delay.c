/**
  ******************************************************************************
  * @file    delay.c
  * @author  Microcontroller Division
  * @version V1.2.0
  * @date    09/2010
  * @brief   delay functions
  ******************************************************************************
  * @copy
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2010 STMicroelectronics</center></h2>
  */

/* Includes ------------------------------------------------------------------*/

#include "stm8l15x.h"
/**
  * @brief  delay for some time in ms unit
  * @caller auto_test
  * @param  n_ms is how many ms of time to delay
  * @retval None
  */
void delay_ms(u16 n_ms)
{
/* Init TIMER 4 */
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 /* HSI div by 1 --> Auto-Reload value: 16M / 64 = 1/4M, 1/4M / 1k = 250*/ 
  TIM4_TimeBaseInit(TIM4_Prescaler_64,250);
  TIM4_SetCounter(0);
  TIM4_ClearFlag(TIM4_FLAG_Update);
  TIM4_Cmd(ENABLE);
  while(n_ms--)
  {
    while(TIM4_GetFlagStatus(TIM4_FLAG_Update) == 0) ;
    TIM4_ClearFlag(TIM4_FLAG_Update);
  }
  TIM4_Cmd(DISABLE);
}

/**
  * @brief  delay for some time in 10us unit(partial accurate)
  * @caller auto_test
  * @param n_10us is how many 10us of time to delay
  * @retval None
  */
void delay_10us(u16 n_10us)
{
/* Init TIMER 4 */
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
/* SYS_CLK_HSI_DIV1 Auto-Reload value: 16M / 1 = 16M, 16M / 100k = 160 */
  TIM4_TimeBaseInit(TIM4_Prescaler_1,160);
  TIM4_SetCounter(0);
  TIM4_ClearFlag(TIM4_FLAG_Update);
  TIM4_Cmd(ENABLE);
  while(n_10us--)
  {
    while(TIM4_GetFlagStatus(TIM4_FLAG_Update) == 0) ;
    TIM4_ClearFlag(TIM4_FLAG_Update);
  }
  TIM4_Cmd(DISABLE);
 CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);

}

/******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
