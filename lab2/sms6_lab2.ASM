	JMP progStart
	DB 7
	DB 5
progStart:
	CLO
	MOV AL,[02]
	MOV BL,[03]
	SUB AL,BL
	MOV [09],AL
END