PIN_RESET   EQU 0x40004200		
SSI0_DR_R   EQU 0x40008008	
SSI0_SR_R   EQU 0x4000800C
DC          EQU 0x40004100

;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			EXPORT  	CONFIG_NOKIA	; Make available
			EXTERN 		DELAY100	

CONFIG_NOKIA	PROC
	
			PUSH {LR}
				LDR R1, =DC
				LDR R0, [R1]
				MOV R0, #0 ; 
				STR R0, [R1]
				
				LDR R1, =PIN_RESET
				LDR R0, [R1]
				MOV R0, #0 ; 
				STR R0, [R1]
				
				BL	DELAY100
				BL	DELAY100
				
				LDR R1, =PIN_RESET
				LDR R0, [R1]
				MOV R0, #0x80 ;
				STR R0, [R1]
				
WAIT1			LDR R1, =SSI0_SR_R
				LDR R0, [R1]
				ANDS R0, #0x00000010 ;SSI Busy Bit
				BNE WAIT1				
				
				LDR R1, =SSI0_DR_R
				LDR R0, [R1]
				MOV R0, #0x21 ;chip active; horizontal addressing mode (V = 0); use extended instruction set (H = 1)
				STR R0, [R1]
				
WAIT2			LDR R1, =SSI0_SR_R
				LDR R0, [R1]
				ANDS R0, #0x00000010 ;SSI Busy Bit
				BNE WAIT2				
				
								
				LDR R1, =SSI0_DR_R
				LDR R0, [R1]
				MOV R0, #0xBF				; try 0xB1 (for 3.3V red SparkFun), 0xB8 (for 3.3V blue SparkFun), 0xBF if your display is too dark, or 0x80 to 0xFF if experimenting
				STR R0, [R1]
				
WAIT3			LDR R1, =SSI0_SR_R
				LDR R0, [R1]
				ANDS R0, #0x00000010 ;SSI Busy Bit
				BNE WAIT3				
				
								
				LDR R1, =SSI0_DR_R
				LDR R0, [R1]
				MOV R0, #0x04 ;set temp coefficient
				STR R0, [R1]
				
WAIT4			LDR R1, =SSI0_SR_R
				LDR R0, [R1]
				ANDS R0, #0x00000010 ;SSI Busy Bit
				BNE WAIT4				
				
								
				LDR R1, =SSI0_DR_R
				LDR R0, [R1]
				MOV R0, #0x14 ;LCD bias mode 1:48: try 0x13 or 0x14
				STR R0, [R1]
				
WAIT5			LDR R1, =SSI0_SR_R
				LDR R0, [R1]
				ANDS R0, #0x00000010 ;SSI Busy Bit
				BNE WAIT5				
				
								
				LDR R1, =SSI0_DR_R
				LDR R0, [R1]
				MOV R0, #0x20 ;we must send 0x20 before modifying the display control mode
				STR R0, [R1]
				
WAIT6			LDR R1, =SSI0_SR_R
				LDR R0, [R1]
				ANDS R0, #0x00000010 ;SSI Busy Bit
				BNE WAIT6				
				
								
				LDR R1, =SSI0_DR_R
				LDR R0, [R1]
				MOV R0, #0x0C ; set display control to normal mode: 0x0D for inverse
				STR R0, [R1]
				
WAIT7			LDR R1, =SSI0_SR_R
				LDR R0, [R1]
				ANDS R0, #0x00000010 ;SSI Busy Bit
				BNE WAIT7

				POP{LR}
			ENDP
			BX			LR					
			ALIGN
			END