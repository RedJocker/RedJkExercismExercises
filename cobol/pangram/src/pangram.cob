
        IDENTIFICATION DIVISION.
        PROGRAM-ID. PANGRAM.
        ENVIRONMENT DIVISION.
    
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-SENTENCE PIC X(60).
        01 WS-RESULT PIC 9.
        LOCAL-STORAGE SECTION.
        
        01 LS-HISTOGRAM-STR PIC X(26) VALUE ZEROES.
            88 IS-PANGRAM VALUE ALL "1".
        01 LS-HISTOGRAM-TABLE REDEFINES LS-HISTOGRAM-STR.
            05 FILL OCCURS 26 TIMES.
                10 LS-HISTOGRAM PIC 9(1).
            
        01 LS-IDX PIC 9(2) VALUE 0.
        01 LS-CHAR PIC X(1) VALUE " ".
            88 IS-ALPHA VALUE 'A' THRU 'Z'.
        01 LS-CHAR-NUM PIC 9(3) VALUE 0. 
    
        PROCEDURE DIVISION.
        PANGRAM.
            INITIALIZE LS-HISTOGRAM-TABLE LS-CHAR WS-RESULT
            MOVE FUNCTION UPPER-CASE(WS-SENTENCE) TO WS-SENTENCE
            PERFORM COUNT-CHAR VARYING LS-IDX FROM 1 BY 1 UNTIL LS-IDX > 60
            IF IS-PANGRAM THEN
                MOVE 1 TO WS-RESULT
            END-IF.

        COUNT-CHAR.
            MOVE WS-SENTENCE(LS-IDX:1) TO LS-CHAR
            IF IS-ALPHA
                COMPUTE LS-CHAR-NUM = FUNCTION ORD(LS-CHAR) - 65
                MOVE 1 TO LS-HISTOGRAM(LS-CHAR-NUM)
            END-IF.

            
            
