
MOV AL,C0
MOV [30],AL
CALL 40



ORG 40
PUSHF
PUSH AL
PUSH BL
PROGSTART:
	; MOV BL,[31]
	MOV [AL],BL
	POPF
	POP AL
	POP BL
	RET
	END


