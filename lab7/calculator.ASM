
CALL 50
SUB CL,30
PUSH CL
POP BL

CALL 20

CALL 50
SUB CL,30
PUSH CL
POP DL

CALL 70

;-----------------------------------------;
ORG 20 ; Get operator from user(+, -, *, /)
PUSHF ; Backup all affected registers
PUSH AL ;
GET_OPERATOR:
	IN 00
	CMP AL,2B ; +
	JZ STORE_OPERATOR
	CMP AL,2D ; -
	JZ STORE_OPERATOR
	CMP AL,2A ; *
	JZ STORE_OPERATOR
	CMP AL,2F ; /
	JZ STORE_OPERATOR
	JNZ GET_OPERATOR

STORE_OPERATOR:
	PUSH AL
	POP CL
	POPF
	POP AL
	RET

;----------------------------------------------;
ORG 50 ; Procedure to get user input(an integer)
PUSHF ; Backup all affected registers
PUSH AL
GET_NUMBER:
	IN 00
	CMP AL,3A ; Int must be less than ':'(3A)
	JNS GET_NUMBER
	CMP AL,30 ; Int must be greater than or equal to 0(30)
	JS GET_NUMBER
	PUSH AL
	POP CL
	POPF
	POP AL
	RET

;-----------------------;
ORG 70 ; Get operator (=)
PUSHF
PUSH AL
GET_EQUALS:
	IN 00
	CMP AL,3D
	JZ PROCESS
	JNZ GET_EQUALS

PROCESS:
	CMP CL,2B ; +
	JZ ADDITION
	CMP CL,2D ; -
	JZ SUBTRACTION
	CMP CL,2A ; *
	JZ MULTIPLICATION
	CMP CL,2F ; /
	JZ DIVISION

ADDITION:
	ADD BL,DL
	JMP END

SUBTRACTION:
	SUB BL,DL
	JMP END

MULTIPLICATION:
	MUL BL,DL
	JMP END

DIVISION:
	DIV BL,DL
	JMP END

END:
	POPF
	POP AL
	RET

	END




