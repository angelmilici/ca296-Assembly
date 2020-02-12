;Use the seven segment display , write a program to count down from 99 to 00 , RHS obviously 
JMP mainCode
DB 50

mainCode:
	STI
	MOV BL, 9A;
loop:
	INC AL
	JMP loop

ORG 50
CLI
PUSHF
PUSH AL
PUSH CL
RHD:
 	MOV AL,[BL];
 	MOV CL,[BL]
 	CMP AL,00; check if null i.e. end of table marker
  	JZ FINISH
  	OUT 02; display the digit
  	DEC BL;

LHD:
  	SUB CL,1
  	PUSH CL
  	POP AL
  	OUT 02
  	JMP RHD

FINISH:
	POPF
	POP AL
	POP CL
	STI
  	HALT 
  
  

ORG 90
DB 00; END OF TABLE
DB DF; 9
DB FF; 8
DB 8B; 7
DB FD; 6
DB DD; 5
DB 4F; 4
DB 9F; 3
DB B7; 2
DB 61; 1
DB FB; 0

END:
 	END