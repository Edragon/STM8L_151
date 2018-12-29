   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  53                     ; 25 void Delay(__IO uint16_t nCount)
  53                     ; 26 {
  55                     	switch	.text
  56  0000               _Delay:
  58  0000 89            	pushw	x
  59       00000000      OFST:	set	0
  62  0001 2007          	jra	L13
  63  0003               L72:
  64                     ; 30         nCount--;
  66  0003 1e01          	ldw	x,(OFST+1,sp)
  67  0005 1d0001        	subw	x,#1
  68  0008 1f01          	ldw	(OFST+1,sp),x
  69  000a               L13:
  70                     ; 28     while (nCount != 0)
  72  000a 1e01          	ldw	x,(OFST+1,sp)
  73  000c 26f5          	jrne	L72
  74                     ; 32 }
  77  000e 85            	popw	x
  78  000f 81            	ret
 106                     ; 40 void main(void)
 106                     ; 41 {
 107                     	switch	.text
 108  0010               _main:
 112                     ; 42 	SYSCFG_RIIOSwitchConfig(RI_IOSwitch_14,ENABLE);//CH13E--PB6,CH14E--PB5 ,CH15E--PB4    
 114  0010 ae2401        	ldw	x,#9217
 115  0013 cd0000        	call	_SYSCFG_RIIOSwitchConfig
 117                     ; 44   DAC_DeInit();//默认值
 119  0016 cd0000        	call	_DAC_DeInit
 121                     ; 46   DAC_Init(DAC_Channel_1, DAC_Trigger_None, DAC_OutputBuffer_Disable);//DAC输出通道1，PB5
 123  0019 4b02          	push	#2
 124  001b ae0030        	ldw	x,#48
 125  001e cd0000        	call	_DAC_Init
 127  0021 84            	pop	a
 128                     ; 47   DAC_Cmd(DAC_Channel_1, ENABLE);//使能通道1
 130  0022 ae0001        	ldw	x,#1
 131  0025 cd0000        	call	_DAC_Cmd
 133                     ; 48   DAC_SetChannel1Data(DAC_Align_12b_R,2048);//12位右对齐，改变后面参数的值可以通过测量PB5的电压验证DAC结果
 135  0028 ae0800        	ldw	x,#2048
 136  002b 89            	pushw	x
 137  002c 4f            	clr	a
 138  002d cd0000        	call	_DAC_SetChannel1Data
 140  0030 85            	popw	x
 141                     ; 49 }
 144  0031 81            	ret
 157                     	xdef	_main
 158                     	xdef	_Delay
 159                     	xref	_SYSCFG_RIIOSwitchConfig
 160                     	xref	_DAC_SetChannel1Data
 161                     	xref	_DAC_Cmd
 162                     	xref	_DAC_Init
 163                     	xref	_DAC_DeInit
 182                     	end
