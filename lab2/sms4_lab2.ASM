	JMP progStart
	DB 2
	DB 3
	DB 4
	ORG 05
progStart:
	CLO
	MOV AL,[02]
	INC AL
	MOV [05],AL
END
