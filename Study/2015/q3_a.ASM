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
	MOV BL,8F
	MOV CL,00

loop:
	CMP CL,04
	JZ clearSSD
	STI
	JMP loop

clearSSD:
	MOV AL,00
	OUT 02
	MOV AL,01
	OUT 02
	JMP end

ORG 60
CLI
PUSHF
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