ORG 90
DB FB
DB 61
DB B7
DB 9F
DB 4F
DB DD
DB FD
DB 8B
DB FF
DB DF

ORG 00
JMP mainCode
DB 60

mainCode:
	MOV BL,92
	MOV CL,00

loop:

	STI
	JMP loop

clearSSD:
	MOV AL,00
	OUT 02
	MOV AL,01
	OUT 02

MOV DL,03
SUB BL,90
SUB BL,03
checkDigits:
	IN 00
	SUB AL,30
	CMP AL,BL
	JNZ mainCode
	CMP DL,00
	JZ end
	INC BL
	DEC DL
	JMP checkDigits

ORG 60
CLI
PUSHF
CMP CL,04
JZ clearSSD
INC CL
MOV AL,FA
OUT 02
INC BL
MOV AL,[BL]
OUT 02
POPF
IRET

end:
	END