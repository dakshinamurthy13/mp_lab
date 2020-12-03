.MODEL SMALL
.CODE
        MOV CL,00

        MOV AH,00H      ;TO ENTER THE TERMINAL IN TEXT MODE
        MOV AL,03H      ;
        INT 10H


BACK:
        MOV BH,00H      ;TO TELL COMPILER THAT CURSOR AT BELOW LOCATION
        MOV DH,00H      ;TO SET ROW VALUE OF CURSOR
        MOV DL,00H      ;TO SET COLUMN
        MOV AH,02H
        INT 10H

        MOV AL,CL
        ADD AL,00H
        AAM
        ADD AX,3030H
        MOV CH,AL
        MOV DL,AH
        MOV AH,02H      ;TO PRINT CHAR
        INT 21H
        MOV DL,CH
        MOV AH,02H
        INT 21H
        CALL DELAY
        INC CL
        XOR AX,AX
        CMP CL,100D
        JNE BACK
        JE LAST

DELAY PROC NEAR
        PUSH AX
        PUSH BX
        PUSH CX
        MOV CX,01FFH
        AG:     MOV BX,00FFH
                AG1:    NOP     ;TO UTILIZE TIME
                        DEC BX
                        JNZ AG1
                DEC CX
                JNZ AG
                POP CX
                POP BX
                POP AX
                RET
DELAY ENDP

LAST:   MOV AH,4CH
        INT 21H
        END





