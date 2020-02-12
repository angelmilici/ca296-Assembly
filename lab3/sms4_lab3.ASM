
MOV AL,40	;Moves 40 into AL register
JMP LOOP	;Jumps to LOOP code

LOOP:
	MOV [AL],AL	;Moves value in AL register into memory location of value in AL
	INC AL		;Increments AL
	CMP AL,4A	;Tests to see if value in AL == 4A(50), then zero flag is set
	JNZ LOOP	;If CMP returns 0 LOOP stops otherwise continues
	END		;Program ends