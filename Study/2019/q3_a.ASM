JMP loop

loop:

	CMP CL,05
	JZ end
	MOV AL,FE
	OUT 02
	PUSH AL
	MOV AL,00
	OUT 02
	POP AL
	INC AL
	OUT 02
	MOV AL,01
	OUT 02
	INC CL
	JMP loop

end:
	END