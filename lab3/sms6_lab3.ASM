MOV AL,41	;Move 41 into AL
MOV BL,C0	;Move value of C0 into BL
MOV CL,D0	;Move value of D0 into CL
JMP firstLine

firstLine:
	MOV [BL],AL	;Move value of AL in memory location of BL
	INC AL		;Increment AL
	INC BL		;Increment BL
	CMP BL,CF	;When value of BL becomes CF, the zero flag will be set
	JNZ firstLine	;If CMP returns zero loop stops otherwise continues

JMP secondLine

secondLine:
	MOV [CL],AL	;Moves value of AL in memory location of CL
	INC AL		;Increments AL
	INC CL		;Increments CL
	CMP CL,DB	;Tests to see if value in AL == DB, then zero flag is set
	JNZ secondLine	;If CMP returns 0 LOOP stops otherwise continues
	END		

	