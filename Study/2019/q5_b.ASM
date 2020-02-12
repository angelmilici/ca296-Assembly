
ORG C0
DB "assembly"

ORG D0
DB "language"

ORG 00

MOV AL,C7
MOV BL,E0
MOV DL,BF
PUSH AL
mainCode:
	IN 00
	CMP AL,72
	JZ reverse
	CMP AL,63
	JZ clearVDU
	CALL 67
	JMP mainCode

reverse:
	POP AL
	CALL 35
	MOV AL,D7
	MOV BL,F0
	MOV DL,CF
	PUSH AL
	JMP mainCode

clearVDU:
	MOV AL,C0
	CALL 51
	JMP mainCode

ORG 35
PUSHF
PUSH AL
PUSH BL
loop:
	CMP AL,DL
	JZ exit
	MOV CL,[AL]	
	MOV [BL],CL
	DEC AL
	INC BL
	JMP loop

exit:
	POPF
	POP AL
	POP BL
	RET

ORG 51
PUSHF
PUSH AL
MOV BL,0
loop2:
	CMP AL,FF
	JZ exit2
	MOV [AL],BL
	INC AL
	JMP loop2

exit2:
	POPF
	POP AL
	RET

ORG 67
PUSHF
MOV AL,C0
MOV BL,0
loop3:
	CMP AL,FF
	JZ message
	MOV [AL],BL
	INC AL
	JMP loop3

message:
	MOV AL,C0
	MOV BL,B0
	loop4:
		CMP BL,BB
		JZ exit3
		MOV CL,[BL]
		MOV [AL],CL
		INC AL
		INC BL
		JMP loop4

exit3:
	POPF
	RET

ORG B0
DB 69
DB 6E
DB 76
DB 61
DB 6C
DB 69
DB 64
DB 20
DB 6B
DB 65
DB 79

end:
	END