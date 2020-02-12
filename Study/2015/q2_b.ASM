
ORG A0
DB 3
DB 6
DB 2
DB 4
DB 7
DB 9
DB 5
DB 1
DB 8
DB 0

ORG 00
main:
	MOV CL,A0
	MOV DL,[CL]
	CMP DL,00
	JZ END

loop:
	CMP CL,A9
	JZ main
	MOV AL,[CL]
	INC CL
	MOV BL,[CL]
	CALL 30
	JMP switch

switch:
	PUSH CL
	MOV [CL],BL
	DEC CL
	MOV [CL],AL
	POP CL
	JMP loop

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

END:
	end