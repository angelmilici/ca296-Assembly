
MOV AL,03
MOV BL,04

CALL 30


ORG 30
PUSHF
PUSH AL
PUSH BL
SUB AL,BL
JNS larger
JS smaller


larger:
	POP AL
	POP BL
	JMP exit

smaller:
	POP BL
	POP AL
	JMP exit

exit:
	POPF
	RET

END