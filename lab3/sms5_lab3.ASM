MOV AL,41	;Move 41 into AL
MOV BL,C0	;Move value of C0 into BL

LOOP:
	MOV [BL],AL	;Move value of AL in memory location of BL
	INC AL		;Increment AL
	INC BL		;Increment BL
	CMP BL,C3	;When value of BL becomes C3, the zero flag will be set
	JNZ LOOP	;If CMP returns zero loop stops otherwise continues
	END