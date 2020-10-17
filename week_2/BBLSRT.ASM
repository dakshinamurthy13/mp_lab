.MODEL SMALL
DISPLAY MACRO MSG
        LEA DX,MSG
        MOV AH,09H
        INT 21H
ENDM
.DATA
        LIST DB 05H,01H,03H,09H,12H,02H
        NUMBER EQU ($-LIST)
        MSG1 DB 0DH, 0AH ,"1>>ASCENDING SORT$"
        MSG2 DB 0DH, 0AH ,"2>>DESCENDING SORT$"
        MSG3 DB 0DH, 0AH ,"3>>EXIT$"
        MSG4 DB 0DH, 0AH ,"ENTER YOUR CHOICE$"
        MSG5 DB 0DH, 0AH ,"INVAILD INPUT$"
.CODE
        START:  MOV AX,@DATA
                MOV DS,AX
                MOV CH,NUMBER-1
                DISPLAY MSG1
                DISPLAY MSG2
                DISPLAY MSG3
                DISPLAY MSG4
                MOV AH ,01H
                INT 21H
                SUB AL,30H
                CMP AL,01H
                JE ASCSORT
                CMP AL,02H
                JE DSCSORT
                CMP AL,03H
                JE FINAL
                DISPLAY MSG5
                JMP FINAL
        ASCSORT:MOV BL,00H
                AGAINASC:       MOV SI,OFFSET LIST
                                MOV CL,00H
                                MOV BH,CH
                                SUB BH,BL
                                PASSASC:        CMP CL,BH
                                                JNC NEXTASC
                                                MOV BP,01H
                                                MOV AL,[SI]
                                                CMP AL,DS:[BP][SI]
                                                JC NOTASC
                                                XCHG AL,[SI+1]
                                                XCHG AL,[SI]
                                        NOTASC: INC CL
                                                INC SI
                                                JMP PASSASC
                                        NEXTASC:INC BL
                                                CMP BL,CH
                                                JC AGAINASC
                                                JMP FINAL
        DSCSORT:MOV BL,00H
                AGAINDSC:       MOV SI,OFFSET LIST
                                MOV CL,00H
                                MOV BH,CH
                                SUB BH,BL
                                PASSDSC:        CMP CL,BH
                                                JNC NEXTDSC
                                                MOV BP,01H
                                                MOV AL,[SI]
                                                CMP AL,DS:[BP][SI]
                                                JNC NOTDSC
                                                XCHG AL,[SI+1]
                                                XCHG AL,[SI]
                                        NOTDSC: INC CL
                                                INC SI
                                                JMP PASSDSC
                                        NEXTDSC:INC BL
                                                CMP BL,CH
                                                JNC AGAINDSC
        FINAL:  MOV AH,4CH
                INT 21H
END START



