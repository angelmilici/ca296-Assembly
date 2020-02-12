
JMP mainCode
DB 4A

mainCode:
	STI
loop:
	INC AL
	JMP loop

ORG 4A
CLI
PUSH AL
PUSHF
; ===== Seven Segment Displays Port 02 =================
RightDigit:
	MOV	AL,DF	; 1101 1111
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,FF	; 1111 1111
	OUT	02	; Send the data in AL to Port 02
	
	MOV	AL,8B	; 1000 1011
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,FD	; 1111 1101
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,DD	;
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,4F	;
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,9F	;
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,B7	;
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,B	;
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,FB	;
	OUT	02	; Send the data in AL to Port 02

	JMP	finish

finish:
	POPF
	POP AL
	STI  ; Enable interrupts

END
; ======================================================