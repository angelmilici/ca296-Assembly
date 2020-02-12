ORG C0
DB "NISSAN"
DB 00	;used as end of string

ORG 00
MOV BL,C0	;move C0('N') in BL

	ORG 50 		; Procedure will live at location 50
	MOV AL,C0 	; AL will hold the part of the VDU we are clear
	MOV BL,00
start:
	MOV [AL],BL ;
	; CMP AL,00 ; Was AL=FF a moment ago?
	JNZ start ; If not, go back to start
	RET ; End of the procedure
	END

CHECK_VOWELS:
	MOV CL,[BL]	;move contents of BL('N'...) in CL
	CMP CL,41	;checks if CL is equal to a vowel
	JZ ONTO_STACK	;...if it is then jump to ONTO_STACK code
	CMP CL,45
	JZ ONTO_STACK
	CMP CL,49
	JZ ONTO_STACK
	CMP CL,4F
	JZ ONTO_STACK
	CMP CL,55
	JZ ONTO_STACK
	INC BL		;increment BL(becomes C1, which is 'I')
	CMP CL,00	;..increment until CL is 00
	JNZ CHECK_VOWELS
	JMP END		;..when it is^^ the zero flag is set and loop stops

ONTO_STACK:
	MOV DL,[BL]	;moves vowels into DL
	PUSH DL		;pushes vowels onto stack
	INC BL
	JMP CHECK_VOWELS



END:
	CALL 50
	END