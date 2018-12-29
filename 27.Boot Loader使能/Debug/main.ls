   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  43                     ; 25 void Delay(__IO uint16_t nCount)
  43                     ; 26 {
  45                     	switch	.text
  46  0000               _Delay:
  48  0000 89            	pushw	x
  49       00000000      OFST:	set	0
  52  0001 2007          	jra	L13
  53  0003               L72:
  54                     ; 30         nCount--;
  56  0003 1e01          	ldw	x,(OFST+1,sp)
  57  0005 1d0001        	subw	x,#1
  58  0008 1f01          	ldw	(OFST+1,sp),x
  59  000a               L13:
  60                     ; 28     while (nCount != 0)
  62  000a 1e01          	ldw	x,(OFST+1,sp)
  63  000c 26f5          	jrne	L72
  64                     ; 32 }
  67  000e 85            	popw	x
  68  000f 81            	ret
  94                     ; 46 void main(void)
  94                     ; 47 {
  95                     	switch	.text
  96  0010               _main:
 100                     ; 48 	FLASH_DeInit();
 102  0010 cd0000        	call	_FLASH_DeInit
 104                     ; 49   FLASH_Unlock(FLASH_MemType_Data);//先解锁，注意参数
 106  0013 a6f7          	ld	a,#247
 107  0015 cd0000        	call	_FLASH_Unlock
 109                     ; 51   FLASH_ProgramOptionByte(0x480b,0x55);  
 111  0018 4b55          	push	#85
 112  001a ae480b        	ldw	x,#18443
 113  001d cd0000        	call	_FLASH_ProgramOptionByte
 115  0020 84            	pop	a
 116                     ; 52   FLASH_ProgramOptionByte(0x480c,0xaa);  
 118  0021 4baa          	push	#170
 119  0023 ae480c        	ldw	x,#18444
 120  0026 cd0000        	call	_FLASH_ProgramOptionByte
 122  0029 84            	pop	a
 123  002a               L54:
 125  002a 20fe          	jra	L54
 138                     	xdef	_main
 139                     	xdef	_Delay
 140                     	xref	_FLASH_ProgramOptionByte
 141                     	xref	_FLASH_Unlock
 142                     	xref	_FLASH_DeInit
 161                     	end
