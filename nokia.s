
				AREA    	main, READONLY, CODE
				THUMB
				EXPORT 		__main				
				EXTERN		INIT_NOKIA
				EXTERN		CONFIG_NOKIA
				EXTERN		NokiaCommands
				EXTERN		NokiaClear
				EXTERN		SetCursor_X
				EXTERN		SetCursor_Y
				EXTERN		PrintCursor
				EXTERN		WAITCOMMAND
				EXTERN		WAITDATA
				EXTERN 		DELAY100				
				EXTERN		DELAY100m
				EXTERN 		SetCursor_X
				EXTERN 		SetCursor_Y
				EXTERN 		PRINT
				EXTERN		DRAW_MAP
				EXTERN		SAYI
				EXTERN		ONE
				EXTERN		TWO
				EXTERN		THREE
				EXTERN		FOUR
				EXTERN		FIVE
				EXTERN		SIX
				EXTERN		SEVEN
				EXTERN		EIGHT
				EXTERN		NINE
				EXTERN		ZERO	
				EXTERN		BASAMAK
				EXTERN		ONEONE
				EXTERN		ONETWO
				EXTERN		ONETHREE
				EXTERN		ONEFOUR
				EXTERN		TWOONE
				EXTERN		TWOTWO
				EXTERN		TWOTHREE
				EXTERN		TWOFOUR
				EXTERN		THREEONE
				EXTERN		THREETWO
				EXTERN		THREETHREE
				EXTERN		THREEFOUR
					
					
					
PFdata 	EQU 0x400253FC 				; Port F Data address
	
__main	    	PROC
				BL INIT_NOKIA
				BL CONFIG_NOKIA				
				BL NokiaClear
				
				
				BL	DRAW_MAP
				
				BL	ONEONE
				BL	ONE
				
				BL	ONETWO
				BL	TWO
				
				BL	ONETHREE
				BL	THREE
				
				BL	ONEFOUR
				BL	FOUR
				
				
				
				BL	TWOONE
				BL	FIVE
				
				BL	TWOTWO
				BL	SIX
				
				BL	TWOTHREE
				BL	SEVEN
				
				BL	TWOFOUR
				BL	EIGHT
				
				
				
				BL	THREEONE
				BL	NINE
				
				BL	THREETWO
				BL	ZERO
				
				BL	THREETHREE
				BL	ONE
				
				BL	THREEFOUR
				BL	FOUR



				ENDP
				ALIGN
				END
					