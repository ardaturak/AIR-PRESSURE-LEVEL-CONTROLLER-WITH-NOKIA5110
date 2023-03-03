;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			
			EXPORT	DRAW_MAP
				
			EXTERN	PRINT			
			EXTERN	SetCursor_X
			EXTERN	SetCursor_Y
			EXTERN	DELAY100m
				
DRAW_MAP	PROC
			PUSH {LR}
			PUSH {R0-R12}
			
			
				BL DELAY100m
				MOV R4, #0
				BL SetCursor_X			
				MOV R4, 0
				BL SetCursor_Y
				BL DELAY100m
				
				; M 
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x03
				BL PRINT
				MOV 	R5, #0x06
				BL PRINT
				MOV 	R5, #0x03
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				

				; I 
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x63
				BL PRINT
				MOV 	R5, #0x63
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


				; N 
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x0e
				BL PRINT
				MOV 	R5, #0x1c
				BL PRINT
				MOV 	R5, #0x38
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT


				; : 
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x14
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				
				
				;	.
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
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x60
				BL PRINT
				MOV 	R5, #0x60
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				
				
				
				
				
				BL DELAY100m
				MOV R4, #0
				BL SetCursor_X			
				MOV R4, 2
				BL SetCursor_Y
				BL DELAY100m
				
				
				; M 
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x03
				BL PRINT
				MOV 	R5, #0x06
				BL PRINT
				MOV 	R5, #0x03
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT

				
				; A 
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
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

				; X
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x77
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x1c
				BL PRINT
				MOV 	R5, #0x08
				BL PRINT
				MOV 	R5, #0x1c
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x77
				BL PRINT


				; : 
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x14
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				
				
				
				;	.
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
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x60
				BL PRINT
				MOV 	R5, #0x60
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				
				
				
				
				
				
				
				BL DELAY100m
				MOV R4, #0
				BL SetCursor_X			
				MOV R4, 4
				BL SetCursor_Y
				BL DELAY100m
				
				
				; P 
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x1b
				BL PRINT
				MOV 	R5, #0x1b
				BL PRINT
				MOV 	R5, #0x1b
				BL PRINT
				MOV 	R5, #0x1f
				BL PRINT
				MOV 	R5, #0x1f
				BL PRINT


				; R 
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x1b
				BL PRINT
				MOV 	R5, #0x3b
				BL PRINT
				MOV 	R5, #0x7b
				BL PRINT
				MOV 	R5, #0x7f
				BL PRINT
				MOV 	R5, #0x5f
				BL PRINT
					

				; E 
				MOV 	R5, #0x00
				BL PRINT
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
				MOV 	R5, #0x6b
				BL PRINT
				MOV 	R5, #0x6b
				BL PRINT


				; S 
				MOV 	R5, #0x00
				BL PRINT
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
				
				
				; : 
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x14
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
			
			
				;	.
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
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
				MOV 	R5, #0x60
				BL PRINT
				MOV 	R5, #0x60
				BL PRINT
				MOV 	R5, #0x00
				BL PRINT
			
			
			POP {R0-R12}
			POP {LR}
	
			ENDP
			BX	LR

			ALIGN
			END