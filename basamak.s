;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			
			EXPORT	BASAMAK
			EXPORT	ONEONE
			EXPORT	ONETWO
			EXPORT	ONETHREE
			EXPORT	ONEFOUR
			EXPORT	TWOONE
			EXPORT	TWOTWO
			EXPORT	TWOTHREE
			EXPORT	TWOFOUR
			EXPORT	THREEONE
			EXPORT	THREETWO
			EXPORT	THREETHREE
			EXPORT	THREEFOUR
				
			EXTERN	PRINT			
			EXTERN	SetCursor_X
			EXTERN	SetCursor_Y
			EXTERN	DELAY100m
				
BASAMAK		PROC

			
			
			
			
			
			
			
ONEONE			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				BL DELAY100m
				MOV R4, #43
				BL SetCursor_X			
				MOV R4, 0
				BL SetCursor_Y
				BL DELAY100m

				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR				
			
			
			
ONETWO			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				;	2
				
				BL DELAY100m
				MOV R4, #52
				BL SetCursor_X			
				MOV R4, 0
				BL SetCursor_Y
				BL DELAY100m
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				
				
				
				
ONETHREE		PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				BL DELAY100m
				MOV R4, #61
				BL SetCursor_X			
				MOV R4, 0
				BL SetCursor_Y
				BL DELAY100m
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				
				
				
				
ONEFOUR			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				BL DELAY100m
				MOV R4, #74
				BL SetCursor_X			
				MOV R4, 0
				BL SetCursor_Y
				BL DELAY100m
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR		
			
			
			
			
TWOONE			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				BL DELAY100m
				MOV R4, #43
				BL SetCursor_X			
				MOV R4, 2
				BL SetCursor_Y
				BL DELAY100m

				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR				
			
			
			
TWOTWO			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				;	2
				
				BL DELAY100m
				MOV R4, #52
				BL SetCursor_X			
				MOV R4, 2
				BL SetCursor_Y
				BL DELAY100m
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				
				
				
				
TWOTHREE		PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				BL DELAY100m
				MOV R4, #61
				BL SetCursor_X			
				MOV R4, 2
				BL SetCursor_Y
				BL DELAY100m
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				
				
				
				
TWOFOUR			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				BL DELAY100m
				MOV R4, #74
				BL SetCursor_X			
				MOV R4, 2
				BL SetCursor_Y
				BL DELAY100m
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR




THREEONE			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				BL DELAY100m
				MOV R4, #43
				BL SetCursor_X			
				MOV R4, 4
				BL SetCursor_Y
				BL DELAY100m

				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR				
			
			
			
THREETWO			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				;	2
				
				BL DELAY100m
				MOV R4, #52
				BL SetCursor_X			
				MOV R4, 4
				BL SetCursor_Y
				BL DELAY100m
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				
				
				
				
THREETHREE		PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				BL DELAY100m
				MOV R4, #61
				BL SetCursor_X			
				MOV R4, 4
				BL SetCursor_Y
				BL DELAY100m
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
				
				
				
				
THREEFOUR			PROC			
				PUSH {LR}
				PUSH {R0-R12}
				
				BL DELAY100m
				MOV R4, #74
				BL SetCursor_X			
				MOV R4, 4
				BL SetCursor_Y
				BL DELAY100m
				
				POP {R0-R12}
				POP{LR}
				ENDP
				BX	LR
			
			
			
			
			ALIGN
			END