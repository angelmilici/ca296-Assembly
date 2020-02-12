
MOV AL,C5
MOV DL,CF
CALL 20

ORG C0
DB 48
DB 65
DB 6C
DB 4C
DB 6F

;----------;
ORG 20 ; Procedure to reverse string
PUSHF
PUSH AL
PUSH DL
PROGSTART:
	INC DL
	DEC AL
	MOV BL,[AL]
	CMP BL,[BF]
	JNZ REVERSE
	JZ END

REVERSE: ; Reverse string
	MOV [DL],BL
	JMP PROGSTART

END:
	POPF
	POP AL
	POP DL

	RET
	END