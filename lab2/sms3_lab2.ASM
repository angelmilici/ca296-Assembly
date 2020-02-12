	JMP progStart
	DB 2
	DB 3
	DB 4
	ORG 05
progStart:
	CLO
	MOV AL,[02]
	MOV BL,[03]
	MOV CL,[04]
	ADD AL,BL
	ADD AL,CL
	MOV [05],AL
END