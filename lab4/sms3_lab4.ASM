	ORG 50
	DB 02
	DB 03
	DB 04
	DB 05
	DB 00
	
	ORG 00
	MOV AL,4F
	JMP PROGSTART

PROGSTART:
	INC AL		;checks each number
	MOV CL,0
	MOV BL,[AL]
	CMP BL,00	;ends program when number is 0
	JZ END
	JMP LOOP

LOOP:
	MOV DL,[AL]	
	CMP BL,0
	JZ IF_PRIME
	MOD DL,BL	;if e.g 4 mod 4 is 0 then jump to COUNT
	CMP DL,0
	JZ COUNT
	DEC BL		;else decrement BL and jump back to loop
	JMP LOOP

COUNT:			;this counts the amount of times n is completely divisable
	INC CL
	DEC BL
	JMP LOOP

IF_PRIME:		;checks if n is prime by checking the count
	SUB CL,2	;if prime do nothing
	CMP CL,0
	JNZ IF_NOT_PRIME
	JMP PROGSTART

IF_NOT_PRIME:		;if n is not prime put FF in AL
	MOV BL,FF
	MOV [AL],BL
	JMP PROGSTART

END:
	END