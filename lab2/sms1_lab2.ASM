JMP progStart
ORG 58
progStart:
	CLO ; Close unwanted windows.
	MOV AL,0 ; Copy a 0 into the AL register.
	ADD AL,01 ; Add 01 to AL. Answer goes into AL.
	END ; Program ends