;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main   , READONLY, CODE		
			THUMB                   ; Subsequent instructions are Thumb
			EXPORT  	DELAY100	; Make available

DELAY100 	PROC
			PUSH		{LR}		;
			PUSH		{R0}		; Store the register in Stack
			
			LDR 		R0, =60; Counter value
loop		SUBS		R0,#1
			BNE			loop
		
			POP			{R0}
			POP			{LR}
			BX			LR
			
			ENDP
			ALIGN
			END