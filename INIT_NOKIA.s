;GPIO ports
PORTA_DIR      EQU 0x40004400
PORTA_AFSEL    EQU 0x40004420
PORTA_DEN     EQU 0x4000451C
PORTA_AMSEL    EQU 0x40004528
PORTA_PCTL     EQU 0x4000452C
SYSCTL_RCGC2_R 		  EQU 0x400FE108
	
;SPI	
SYSCTL_RCGC1_R EQU 0x400FE104	
SSI0_CR0_R     EQU 0x40008000
SSI0_CR1_R     EQU 0x40008004
SSI0_CC_R      EQU 0x40008FC8
SSI0_CPSR_R    EQU 0x40008010
	
	
	
	
	;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			EXPORT  	INIT_NOKIA	; Make available


INIT_NOKIA	PROC	
			; Setup GPIO
;;;;;;;;;;;;;;;;;;GPIO INITIALIZATION;;;;;;;;;;;;;;;;;;;;;;;;;;;;;				
			; Enable GPIO clock to use debug USB as com port (PA0, PA1)
			LDR R1, =SYSCTL_RCGC2_R ; isim degisebilir
			LDR R0, [R1]
			ORR R0, R0, #0x01 ; set bit 0 to enable port A clock
			STR R0, [R1]
			NOP ; Let clock stabilize
			NOP
			NOP

			
			;direction
			LDR R1, =PORTA_DIR
			LDR R0, [R1]
			ORR R0, R0, #0xC0 ; set bits 1,0 to enable digital on PA0, PA1
			STR R0, [R1]
			
			; Enable/Disable alternate functions selected			
			LDR R1, =PORTA_AFSEL
			LDR R0, [R1]
			ORR R0, R0, #0x2C 		;enable alt funct on PA2,3,5
			BIC R0, R0, #0xC0	    ; disable alt funct on PA6,7
			STR R0, [R1]
			
			; Make PA0, PA1 digital
			LDR R1, =PORTA_DEN
			LDR R0, [R1]
			ORR R0, R0, #0xEC ; enable digital I/O on PA2,3,5,6,7
			STR R0, [R1]
			
			LDR R1, =PORTA_PCTL
			LDR R0, [R1]
			BIC R0, R0, #0x00000F00 ;configure PA2 as SSI
			ORR R0, R0, #0x00000200	
			BIC R0, R0, #0x0000F000 ;configure PA3 as SSI
			ORR R0, R0, #0x00002000	
			BIC R0, R0, #0x00F00000 ;configure PA5 as SSI
			ORR R0, R0, #0x00200000				
			BIC R0, R0, #0x0F000000 ;configure PA6 as GPIO
			BIC R0, R0, #0xF0000000 ;configure PA7 as GPIO
			STR R0, [R1]
			
			LDR R1, =PORTA_AMSEL
			LDR R0, [R1]
			BIC R0, R0, #0xEC ; clear bits 1,0 to disable analog on PA0, PA1
			STR R0, [R1]
			
			
			
			
			
			
;;;;;;;;;;;;;;;;;;SPI INITIALIZATION;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			
			LDR R1, =SYSCTL_RCGC1_R ; isim degisebilir
			LDR R0, [R1]
			ORR R0, R0, #0x00000010 
			STR R0, [R1]
			NOP ; Let clock stabilize
			NOP
			NOP
			NOP
			NOP
			NOP
			
			;direction
			LDR R1, =SSI0_CR1_R
			LDR R0, [R1]
			BIC R0, R0, #0x00000002 ; disable SSI
			STR R0, [R1]
			BIC R0, R0, #0x00000004 ;master mode
			STR R0, [R1]
				
			LDR R1, =SSI0_CC_R
			LDR R0, [R1]
			BIC R0, R0, #0x0000000F		
			STR R0, [R1]
			
				; clock divider for 3.33 MHz SSIClk (80 MHz PLL/24)
                ; SysClk/(CPSDVSR*(1+SCR))
                ; 80/(24*(1+0)) = 3.33 MHz (slower than 4 MHz)
		
			LDR R1, =SSI0_CPSR_R
			LDR R0, [R1]
			BIC R0, R0, #0x0000000F ;
			BIC R0, R0, #0x000000F0 ;
			ORR R0, R0, #24 ;
			STR R0, [R1]
			
			
				
			LDR R1, =SSI0_CR0_R
			LDR R0, [R1]
			BIC R0, R0, #0x00000F00 ;
			BIC R0, R0, #0x0000F000 ; SSI Serial Clock Rate
			BIC R0, R0, #0x00000080 ; SSI Serial Clock Phase	
			BIC R0, R0, #0x00000040 ; SSI Serial Clock Polarity
			BIC R0, R0, #0x00000030 ; SSI Frame Format Select
			BIC R0, R0, #0x0000000F ; SSI Data Size Select
			ORR R0, R0, #0x00000007 ; // 8-bit data
			STR R0, [R1]
			
			LDR R1, =SSI0_CR1_R
			LDR R0, [R1]
			ORR R0, R0, #0x00000002 ; Enable SSI
			STR R0, [R1]
			
			
			
			
			
			ENDP
			BX			LR					
			ALIGN
			END