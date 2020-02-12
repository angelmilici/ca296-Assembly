
ORG A0 ; Test numbers at memory location A0
DB 01
DB 02
DB 03
DB 04
DB 05
DB 06
DB 07
DB 08
DB 09

ORG 00
MOV AL,A0
MOV BL,A9

loop:
	CALL 50
	CMP AL,BL
	JZ end
	INC AL
	JMP loop
	HALT

ORG 50
PUSHF
PUSH BL
MOV BL,[AL]
MOD BL,02
CMP BL,00
POP BL
JZ exit

continue:
	PUSH BL
	MOV BL,[AL]
	ADD CL,BL
	POP BL

exit:
	POPF
	RET

end:
	END