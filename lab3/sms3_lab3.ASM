JMP progStart
	DB 00
	DB 03
	DB 04
	DB 05
	DB 06
	DB 07
	DB 08
progStart:
	MOV [00],AL
	MOV AL,00
	MOV [01],AL
	MOV AL,01
	MOV [02],AL
	MOV AL,02
	MOV CL,[08]
LOOP:
	MOV BL,[CL]
	ADD AL,BL
	DEC CL
	JNZ LOOP
	END