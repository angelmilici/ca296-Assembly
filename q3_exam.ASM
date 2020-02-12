
MOV AL,BF
CALL 30

CALL 60

MOV AL,CF
CALL 30

CALL 60

MOD DL,2
CMP DL,0
JNZ NOT_EQUAL

MOV AL,BF

CALL 80

ORG 20
NOT_EQUAL:
	MOV AL,01
HALT

ORG C0
DB 48
DB 65
DB 6C
DB 4C
DB 6F
DB 00

ORG D0
DB 68
DB 45
DB 6C
DB 6C
DB 00

;------------------------------------------;
ORG 30 ; Convert both strings to lowercase
PUSHF ; Backup all affected registers
PUSH AL
PUSH BL
NEXT_LETTER: ; checks each letter
	INC AL
	MOV BL,[AL]
	MOV CL,[AL]
	CMP BL,00 ; stops when it is zero
	JZ END

PROGSTART:
	SUB BL,5B ; checks if the letter is either uppercase or lowercase
	JS CONVERT_UPPER
	JNS NEXT_LETTER

CONVERT_UPPER:
	ADD CL,20 ; converts uppercase letters to lowercase
	MOV [AL],CL
	JMP NEXT_LETTER

END:
	POP BL ; Restore all affected registers
	POP AL
	POPF
	RET ; and we are done!

;-------------------------------------------;
ORG 60	; Check if strings are equal length
PUSHF ; Backup all affected registers
PUSH AL
PUSH BL
NEXT_LETTER1:
	INC AL
	MOV BL,[AL]
	CMP BL,00
	JZ END1

COUNTER:
	INC DL
	JMP NEXT_LETTER1

END1:
	POP BL ; Restore all affected registers
	POP AL
	POPF
	RET ; and we are done!

;------------------------------------------------;
ORG 80 ; Check if chars in both strings are equal
PUSHF ; Backup all affected registers
PUSH AL
PUSH BL
MOV BL,CF ; second string
NEXT_LETTER2:
	INC AL
	INC BL
	MOV CL,[AL]
	MOV DL,[BL]
	CMP CL,00
	JZ IS_EQUAL

COMPARE_CHAR: ; Compares each character in both strings
	CMP CL,DL
	JZ NEXT_LETTER2
	JZ NOT_EQUAL1

NOT_EQUAL1:
	POP BL ; Restore all affected registers
	POP AL
	POPF
	MOV AL,01
	JMP END2

IS_EQUAL:
	POP BL ; Restore all affected registers
	POP AL
	POPF
	MOV AL,00
	JMP END2

END2:
	RET

	END






