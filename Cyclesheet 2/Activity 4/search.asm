.model small
.stack 64
.data
ARR dB 01H, 04H, 02H, 05H, 07H, 06H
.code
START: 	MOV AX, @DATA
		MOV DS, AX
		MOV BL, 07H
		MOV CX, 05H
		LEA SI, ARR
		L1: MOV AL, [SI]
			CMP AL, BL
			JE PRINT
			INC SI
		LOOP L1
		PRINT:	MOV DL, 05H
				SUB DL, CL
				ADD DL, '0'
				MOV AH, 02H
				INT 21H
				JMP EXIT
		EXIT:	MOV AH, 4CH
				INT 21H
				HLT
END START