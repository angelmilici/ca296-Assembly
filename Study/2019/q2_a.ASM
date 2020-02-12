
JMP main
DB 30

main:
	MOV BL,C0
	MOV AL,00
	MOV [BL],AL

loop:
	STI ; enable interrupts
	JMP loop

ORG 30
CLI
PUSHF
CMP AL,00
JZ change

CMP AL,5F
JZ change_1

change:
	MOV AL,2D
	MOV [BL],AL
	JMP exit

change_1:
	MOV AL,20
	MOV [BL],AL
	JMP exit

exit:
	MOV AL,00
	MOV [BL],AL
	CMP BL,FF
	JZ finish
	INC BL
	POPF
	IRET

finish:
	HALT

END