ORG C0
DB 48
DB 65
DB 6C
DB 4C
DB 6F

DB 57
DB 6F
DB 52
DB 6C
DB 44
DB 00

ORG 00
MOV AL,BF
JMP NEXT_LETTER

NEXT_LETTER:		;checks each letter
	INC AL
	MOV BL,[AL]
	MOV CL,[AL]
	CMP BL,00	;stops when it is zero
	JZ END


PROGSTART:
	SUB BL,5B		;checks if the letter is either uppercase or lowercase
	JS CONVERT_UPPER
	JNS CONVERT_LOWER

CONVERT_UPPER:
	ADD CL,20		;converts uppercase letters to lowercase
	MOV [AL],CL
	JMP NEXT_LETTER

CONVERT_LOWER:
	SUB CL,20		;converts lowercase letters to uppercase
	MOV [AL],CL
	JMP NEXT_LETTER

END:

	END