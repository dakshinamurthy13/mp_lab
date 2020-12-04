.MODEL SMALL
.DATA
        N DW 8
        R DW 1
        NCR DW 0
.CODE
        START:
        MOV AX,@DATA
        MOV DS,AX

        MOV AX,N
        MOV BX,R
        CALL NCRPROC
        CALL DISP
        JMP FINAL


NCRPROC PROC NEAR
        CMP AX,BX  ;R=N
        JE RES1
        CMP BX,0  ;R=0
        JE RES1
        CMP BX,1 ;R=1
        JE RESN
        DEC AX
        CMP BX,AX   ;R=N-1
        JE INCR
        PUSH AX
        PUSH BX
        CALL NCRPROC
        POP BX
        POP AX
        DEC BX
        PUSH AX
        PUSH BX
        CALL NCRPROC
        POP BX
        POP AX
        RET

RES1:   INC NCR
        RET
INCR:   INC NCR
RESN:   ADD NCR,AX
        RET

NCRPROC ENDP

DISP PROC NEAR
        MOV AX,NCR
        AND AX,00FFH ;beacuse we are expecting only two digit ans
        AAM
        MOV BX,AX
        ADD BX,3030H
        MOV DL,BH
        MOV AH,02H
        INT 21H
        MOV DL,BL
        MOV AH,02H
        INT 21H
        RET
DISP ENDP

FINAL:  MOV AH,4CH
        INT 21H

END START
