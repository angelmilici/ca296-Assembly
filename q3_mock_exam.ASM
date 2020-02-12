mov al,7c
mov bl,30
xor al,bl


ORG 90
DB FB; 0
DB 61; 1
DB B7; 2
DB 9F; 3
DB 4F; 4
DB DD; 5
DB FD; 6
DB 8B; 7
DB FF; 8
DB DF; 9

ORG 00
JMP main
DB 20
DB 30

ORG 20 ; ISR that does nothing(timer interrupt)
IRET

main:
	STI ; enable interrupts
	OUT 07
	JMP main

ORG 30
CLI ; disable interrupts
PUSHF
input:
	MOV BL,90
	IN 07
	CMP AL,71
	JZ exit
	CMP AL,3A
	JNS input
	CMP AL,30
	JS input
	POPF
	CALL 50
	IRET

exit:
	HALT

ORG 50
PUSHF
PUSH AL
PUSH BL

rhd:
	AND AL,0F
	PUSH AL
	POP CL
	ADD BL,CL
	MOV AL,[BL]
	OUT 02
	POP BL
	POP AL

lhd:
	AND AL,F0
	DIV AL,10
	PUSH AL
	POP CL
	ADD BL,CL
	MOV AL,[BL]
	SUB AL,01
	OUT 02

finish:
	POPF
	RET

end:
	END