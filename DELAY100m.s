;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			EXPORT  	DELAY100m	; Make available

DELAY100m 	PROC
			PUSH		{R0}		; Store the register in Stack
			
			LDR 		R0, =250000; Counter value
loop		SUBS		R0,#1
			BNE			loop
		
			POP			{R0}
			BX			LR
			
			ENDP
			ALIGN
			END