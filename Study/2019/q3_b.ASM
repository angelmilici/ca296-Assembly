
ORG 90
DB 00; END OF TABLE
DB DF; 9
DB 8B; 7
DB DD; 5
DB 9F; 3
DB 61; 1
DB FB; 0

ORG A0
DB 00; END OF TABLE
DB DE; 9
DB FE; 8
DB 8A; 7
DB FC; 6
DB DC; 5
DB 4E; 4
DB 9E; 3
DB B6; 2
DB 60; 1
DB FA; 0

ORG 00
mainCode:
	MOV BL,96;
	MOV CL,AA
	JMP RHD

reset:
	CMP CL,A0
	JZ FINISH
	MOV BL,95
	MOV AL,[BL]
	OUT 02
	DEC BL
	JMP LHD

RHD:
 	MOV AL,[BL];
 	CMP AL,00; check if null i.e. end of table marker
  	JZ reset
	PUSH AL
  	OUT 02; display the digit
  	DEC BL;
	POP AL
	CMP AL,FB
	JZ LHD
	JMP RHD

LHD:
	MOV AL,[CL]
  	OUT 02
	DEC CL
  	JMP RHD

FINISH:
	END