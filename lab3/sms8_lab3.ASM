ORG C0
DB "N"
DB "I"
DB "S"
DB "S"
DB "A"
DB "N"
DB 00	;used as end of string

ORG 00
MOV AL,5A	;move 'Z' in AL
MOV BL,C0	;move C0('N') in BL

CHECK_VOWELS:
	MOV CL,[BL]	;move contents of BL('N'...) in CL
	CMP CL,41	;checks if CL is equal to a vowel
	JZ REPLACE	;...if it is then jump to replace code
	CMP CL,45
	JZ REPLACE
	CMP CL,49
	JZ REPLACE
	CMP CL,4F
	JZ REPLACE
	CMP CL,55
	JZ REPLACE
	INC BL		;increment BL(becomes C1, which is 'I')
	CMP CL,00	;..increment until CL is 00
	JNZ CHECK_VOWELS	;..when it is the zero flag is set and loop stops
	JMP END

REPLACE:
	MOV [BL],AL	;moves AL('Z') in BL, replaces vowel with 'Z'
	JMP CHECK_VOWELS

END:
	END