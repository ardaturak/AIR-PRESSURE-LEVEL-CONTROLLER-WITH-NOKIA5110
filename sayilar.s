;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			
			EXPORT	SAYI
			EXPORT	ONE
			EXPORT	TWO
			EXPORT	THREE
			EXPORT	FOUR
			EXPORT	FIVE
			EXPORT	SIX
			EXPORT	SEVEN
			EXPORT	EIGHT
			EXPORT	NINE
			EXPORT	ZERO
			EXPORT	BOS
				
			EXTERN	PRINT			
			EXTERN	SetCursor_X
			EXTERN	SetCursor_Y
			EXTERN	DELAY100m
				
SAYI		PROC

			
			
			
			
BOS				PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
		;	BOSLUK
				
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT


				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR


			
			
ONE				PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
		;	1
				
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x60
				BL PRINT
				MOV 	R5, #0x66
				BL PRINT
				MOV 	R5, #0x66
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x60
				BL PRINT
				MOV 	R5, #0x60
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT


				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR				
			
			
			
TWO				PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				;	2
				
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x7b
				BL PRINT
				MOV 	R5, #0x7b
				BL PRINT
				MOV 	R5, #0x6b
				BL PRINT
				MOV 	R5, #0x6b
				BL PRINT
				MOV 	R5, #0x6b
				BL PRINT
				MOV 	R5, #0x6f
				BL PRINT
				MOV 	R5, #0x6f
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				
				
THREE			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				;	3
				
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x63
				BL PRINT
				MOV 	R5, #0x63
				BL PRINT
				MOV 	R5, #0x6b
				BL PRINT
				MOV 	R5, #0x6b
				BL PRINT
				MOV 	R5, #0x6b
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				
				
				
				
FOUR			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				;	4
				
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x1f
				BL PRINT
				MOV 	R5, #0x1f
				BL PRINT
				MOV 	R5, #0x18
				BL PRINT
				MOV 	R5, #0x18
				BL PRINT
				MOV 	R5, #0x18
				BL PRINT
				MOV 	R5, #0x7e
				BL PRINT
				MOV 	R5, #0x7e
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR


FIVE			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				;	5
				
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x6f
				BL PRINT
				MOV 	R5, #0x6f
				BL PRINT
				MOV 	R5, #0x6b
				BL PRINT
				MOV 	R5, #0x6b
				BL PRINT
				MOV 	R5, #0x6b
				BL PRINT
				MOV 	R5, #0x7b
				BL PRINT
				MOV 	R5, #0x7b
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				
				
				
				
SIX				PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				;	6
				
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x6c
				BL PRINT
				MOV 	R5, #0x6c
				BL PRINT
				MOV 	R5, #0x6c
				BL PRINT
				MOV 	R5, #0x7c
				BL PRINT
				MOV 	R5, #0x7c
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR




SEVEN			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				;	7
				
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x43
				BL PRINT
				MOV 	R5, #0x63
				BL PRINT
				MOV 	R5, #0x73
				BL PRINT
				MOV 	R5, #0x3b
				BL PRINT
				MOV 	R5, #0x1f
				BL PRINT
				MOV 	R5, #0x0f
				BL PRINT
				MOV 	R5, #0x07
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				
				
				
				
EIGHT			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				;	8
				
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x6b
				BL PRINT
				MOV 	R5, #0x6b
				BL PRINT
				MOV 	R5, #0x6b
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR


NINE			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				;	9
				
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x1f
				BL PRINT
				MOV 	R5, #0x1f
				BL PRINT
				MOV 	R5, #0x1b
				BL PRINT
				MOV 	R5, #0x1b
				BL PRINT
				MOV 	R5, #0x1b
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR


				
ZERO			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				;	0
				
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x63
				BL PRINT
				MOV 	R5, #0x63
				BL PRINT
				MOV 	R5, #0x63
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR			
			
			
			
			
			
			
			ALIGN
			END