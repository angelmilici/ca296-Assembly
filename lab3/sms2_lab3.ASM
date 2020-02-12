
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

progStart:
	MOV CL,[A]


loop:
	ADD AL,CL
	DEC CL
	JNZ loop
	END