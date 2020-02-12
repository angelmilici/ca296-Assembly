
MOV AL,BF
MOV BL,FF
JMP start

start:
	MOV [AL],BL
	DEC AL
	JNZ start

end