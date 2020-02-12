JMP initialise
DB 50 ; timer intrrupt location [02]

initialise:
	MOV BL,C0
	MOV CL,C1

mainProg:
	STI
	JMP mainProg

ORG 50
CLI
PUSHF
CMP AL,30 ; check if last char displayed on VDU was 0
JZ one ; if it was jump to zero loop
JNZ zero

zero:
	MOV AL,30
	MOV [BL],AL
	ADD BL,02
	POPF
	IRET

one:
	MOV AL,31
	MOV [CL],AL
	CMP CL,FF ; check if cl is FF
	JZ end
	ADD CL,02
	POPF
	IRET

end:
	END