JMP progStart
DB 00
DB 01
DB 02
DB 03
DB 04
DB 05
DB 06
DB 07
DB 08
DB A
DB B

progStart:
	MOV CL, 02
	JMP loop

loop:
	MOV BL, [CL]
	MOD BL, 2
	JNZ odd
	INC CL
	CMP CL, 0B
	JZ end
	JMP loop

odd:
	INC AL
	INC CL
	JMP loop

end:

	END
