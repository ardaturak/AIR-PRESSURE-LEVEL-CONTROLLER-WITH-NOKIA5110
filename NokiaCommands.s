PIN_RESET   EQU 0x40004200		
SSI0_DR_R   EQU 0x40008008	
SSI0_SR_R   EQU 0x4000800C
DC          EQU 0x40004100

;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			EXPORT  	NokiaCommands	; Make available
			EXPORT  	NokiaClear
			EXPORT		SetCursor_X
			EXPORT		SetCursor_Y
			EXPORT		PrintCursor
			EXPORT   	PrintMap
			EXPORT		WAITCOMMAND
			EXPORT		WAITDATA
			EXTERN 		DELAY100		
				EXPORT		PRINT
NokiaCommands			PROC	
						
				
NokiaClear		PROC			;CLEAR ALL SCREEN
				PUSH {LR}
				PUSH {R0-R2}
				LDR R1, =DC				;data
				LDR R0, [R1]
				MOV R0, #0x40 ; 
				STR R0, [R1]							
				MOV R2, #518
		
loopClear		BL WAITDATA	
				MOV R5, #0x00	; SEND 0X00 518 TIMES
				BL PRINT
				SUBS R2,#1				
				BNE loopClear
				POP {R0-R2}
				POP{LR}
				ENDP
				BX	LR		
				LTORG



WAITCOMMAND		PROC		;WAIT IF THE SSI IS BUSY
				PUSH {LR}
				PUSH {R0-R1}
wcommand		LDR R1, =SSI0_SR_R
				LDR R0, [R1]
				ANDS R0, #0x00000010 ;SSI Busy Bit
				BNE wcommand
				POP {R0-R1}
				POP{LR}
				
				ENDP
				BX	LR
		
WAITDATA		PROC ;WAIT SSI BEFORE SENDING DATA
				PUSH {LR}
				PUSH {R0-R1}				
wdata			LDR R1, =SSI0_SR_R		
				LDR R0, [R1]
				ANDS R0, #0x00000002 
				BEQ wdata					
				POP {R0-R1}
				POP{LR}
				ENDP
				BX	LR
				LTORG


SetCursor_X	PROC			;ADJUST SET CURSORX
	
				PUSH {LR}	
				PUSH {R0-R4}
				LDR R1, =DC			;command 
				LDR R0, [R1]
				MOV R0, #0 ; 
				STR R0, [R1]				
				BL WAITCOMMAND				
				LDR R1, =SSI0_DR_R				
				MOV R3,  0x80			
				ORR R0, R3,R4
				STR R0, [R1]						
				BL WAITCOMMAND				
				LDR R1, =DC				;data
				LDR R0, [R1]
				MOV R0, #0x40 ; 
				STR R0, [R1]
				POP {R0-R4}
				POP{LR}
				ENDP
				BX	LR
				LTORG


SetCursor_Y	PROC		;ADJUST SET CURSORX
	
				PUSH {LR}	
				PUSH {R0-R4}
				LDR R1, =DC			;command 
				LDR R0, [R1]
				MOV R0, #0 ; 
				STR R0, [R1]				
				BL WAITCOMMAND				
				LDR R1, =SSI0_DR_R				
				MOV R3,  0x40
				ORR R0, R3,R4
				STR R0, [R1]						
				BL WAITCOMMAND				
				LDR R1, =DC				;data
				LDR R0, [R1]
				MOV R0, #0x40 ; 
				STR R0, [R1]
				POP	{R0-R4}
				POP{LR}
				ENDP
				BX	LR
				LTORG

PrintCursor		PROC
				PUSH {LR}
			;	SUB  R5, R8, #3
				
				
		
			;	MOV R5, #0x00				
			;	BL	PRINT
			;	BL  DELAY100
			
				
			    MOV R5, #0x1C
				BL	PRINT
				BL  DELAY100
				MOV R5, #0x1E
				BL	PRINT
				BL  DELAY100
				MOV R5, #0x1F
				BL	PRINT
				BL  DELAY100
				MOV R5, #0x1E
				BL	PRINT
				BL  DELAY100
				MOV R5, #0x1C
				BL	PRINT
				BL  DELAY100
				
			;	MOV R5, #0x00
			;	BL	PRINT
			;	BL  DELAY100
				
				POP{LR}
				BX	LR
				ENDP
				




PRINT			PROC			;SEND DATA TO PRINT
				PUSH {LR}		
				PUSH {R0-R5}		
				LDR R1, =DC				;data
				LDR R0, [R1]
				MOV R0, #0x40 ; 
				STR R0, [R1]

				BL WAITDATA
				LDR R1, =SSI0_DR_R					
				STR R5, [R1]
				
			
			;	BL WAITDATA
			;	LDR R1, =SSI0_DR_R	
			;	LDR R4, [R1]
			;	ORR R5, R4		
			;	STR R5, [R1]
			
			
				BL WAITDATA			
			
				POP {R0-R5}
				POP{LR}
				 
				BX	LR	
				LTORG








      
PrintMap		PROC		;PRINTS THE MAP
	
				PUSH {LR}		
				PUSH {R0-R8}
;;;;;;;;;;;;;;;TOP side;;;;;;;;;;;;;;;;;;;			
				
				MOV R7, #5
				MOV R6, #64				
loopTopSide		ADD	R7,R7,#1
				MOV	R4,R7
				BL SetCursor_X
				
				MOV R4, #0 
				BL SetCursor_Y	
				BL DELAY100	
				MOV R5, 0x80
				BL PRINT
				
				BL DELAY100	
				SUBS R6, #1
				BNE loopTopSide

;;;;;;;;;;;;;;;TOP side-end;;;;;;;;;;;;;;;;;;;	

;;;;;;;;;;;;;;;BOTTOM side;;;;;;;;;;;;;;;;;;;			
				
				MOV R7, #5
				MOV R6, #64				
loopBotSide		ADD	R7,R7,#1
				MOV	R4,R7
				BL SetCursor_X
				
				MOV R4, #5 
				BL SetCursor_Y	
				BL DELAY100	
				MOV R5, 0x01
				BL PRINT
				
				BL DELAY100	
				SUBS R6, #1
				BNE loopBotSide

;;;;;;;;;;;;;;;BOTTOM side-end;;;;;;;;;;;;;;;;;;;	

;;;;;;;;;;;;;;;left side;;;;;;;;;;;;;;;;;;;						
				MOV R4, #6
				BL SetCursor_X				
				MOV R4, #1
				BL SetCursor_Y
				MOV R5, 0xFF				
				BL PRINT
				
				BL DELAY100	
				MOV R4, #6
				BL SetCursor_X
				MOV R4, #2
				BL SetCursor_Y	
				MOV R5, 0xFF
				BL PRINT
			
			BL DELAY100	
			MOV R4, #6
			BL SetCursor_X
			MOV R4, #3
			BL SetCursor_Y	
			MOV R5, 0xFF
			BL PRINT
			
			BL DELAY100	
			MOV R4, #6
			BL SetCursor_X
			MOV R4, #4
			BL SetCursor_Y	
			MOV R5, 0xFF
			BL PRINT
			BL DELAY100	
;;;;;;;;;;;;;;;left side-end;;;;;;;;;;;;;;;;;;;	
				
				
				
				
;;;;;;;;;;;;;;;right side;;;;;;;;;;;;;;;;;;;						
				MOV R4, #69
				BL SetCursor_X				
				MOV R4, #1
				BL SetCursor_Y
				MOV R5, 0xFF				
				BL PRINT
				
				BL DELAY100	
				MOV R4, #69
				BL SetCursor_X
				MOV R4, #2
				BL SetCursor_Y	
				MOV R5, 0xFF
				BL PRINT
			
				BL DELAY100	
				MOV R4, #69
				BL SetCursor_X
				MOV R4, #3
				BL SetCursor_Y	
				MOV R5, 0xFF
				BL PRINT
				
				BL DELAY100	
				MOV R4, #69
				BL SetCursor_X
				MOV R4, #4
				BL SetCursor_Y	
				MOV R5, 0xFF
				BL PRINT
				BL DELAY100	
;;;;;;;;;;;;;;;left side-end;;;;;;;;;;;;;;;;;;;			
				
								
				POP {R0-R8}
				POP{LR}
				ENDP
				BX	LR
				
				
EXIT			POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR


			ALIGN
			END