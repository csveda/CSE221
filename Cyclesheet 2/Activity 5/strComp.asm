.model small
.stack 64
.data
STR1 dB "Hello!"
STR2 dB "Hel!!!"
.code
START: 	MOV AX, @DATA
		MOV DS, AX
		CLD
		MOV AX, CS
		MOV DS, AX
		MOV ES, AX
		LEA SI, STR1
		LEA DI, STR2
		MOV CX, 0006H
		REPE CMPSB
		JNZ NOT_EQ
		MOV DL, 'Y'
		MOV AH, 02H
		INT 21H
		JMP EXIT
		NOT_EQ:	MOV DL, 'N'
				MOV AH, 02H
				INT 21H
		EXIT:	MOV AH, 4CH
				INT 21H
				HLT
END START