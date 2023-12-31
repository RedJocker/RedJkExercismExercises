
        IDENTIFICATION DIVISION.
        PROGRAM-ID. reverse-string.
        
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-STRING PIC X(64).

        LOCAL-STORAGE SECTION.
        01 LS-LEN PIC 9(2).
        01 LS-HALF-LEN PIC 9(2).
        01 IDX PIC 9(2).
        01 LS-CHAR PIC X(1).
                
        PROCEDURE DIVISION.
        REVERSE-STRING.
            INSPECT WS-STRING REPLACING TRAILING SPACES BY X"00"
            PERFORM VARYING IDX FROM 1 BY 1 UNTIL WS-STRING(IDX:1) = X"00"
            END-PERFORM

            COMPUTE LS-LEN = IDX
            COMPUTE LS-HALF-LEN = IDX / 2

            PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > LS-HALF-LEN
                MOVE WS-STRING(IDX:1) TO LS-CHAR
                MOVE WS-STRING((LS-LEN - IDX):1) TO WS-STRING(IDX:1)
                MOVE LS-CHAR TO WS-STRING((LS-LEN - IDX):1)
            END-PERFORM

            INSPECT WS-STRING REPLACING ALL X"00" BY SPACE.
            
