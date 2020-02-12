
JMP mainCode
DB 30
DB 12

mainCode:
	OUT 07
	INT 03
	PUSH AL
	POP DL
	INT 03
loop:
	STI
	JMP loop

ORG 12
CLI
PUSHF
input:
	IN 07
	CMP AL,30
	JS input
	CMP AL,3A
	JNS input
	POPF
	IRET



ORG 30
CLI
PUSHF
PUSH AL
MOV AL,00
OUT 02
MOV AL,01
OUT 02
MOV BL,90
MOV CL,A0

AND DL,0F
ADD CL,DL
CALL 80
POP AL
DEC CL
AND AL,0F
ADD BL,AL

loop1:
	CALL 70
	DEC BL
	CMP BL,8F
	JNZ loop1
	MOV BL,99
	CMP CL,9F
	JZ loopend
	CALL 80
	DEC CL
	JMP loop1

loopend:
	HALT

ORG 70
PUSHF
MOV AL,[BL]
OUT 02
POPF
RET

ORG 80
PUSHF
MOV AL,[CL]
OUT 02
POPF
RET

ORG 90				; Table is at memory location 90
DB FB; 0
DB 61; 1
DB B7; 2
DB 9F; 3
DB 4F; 4
DB DD; 5
DB FD; 6
DB 8B; 7
DB FF; 8
DB DF; 9				; Code for 0 on RHS

ORG A0				; Table is at memory location A0
DB FA
DB 0A
DB B6
DB 9E
DB 4E
DB DC
DB FC
DB 8A
DB FE
DB DE				; Code for 9 on LHS

END


