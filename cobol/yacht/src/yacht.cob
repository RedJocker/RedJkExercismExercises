
        IDENTIFICATION DIVISION.
        PROGRAM-ID. YACHT.
        DATA DIVISION.
        
        WORKING-STORAGE SECTION.
        01 WS-RESULT PIC 9(2) VALUE ZEROS.
        01 WS-CATEGORY PIC X(15).
        01 WS-DICE PIC 9(5) VALUE ZEROS.
        
        LOCAL-STORAGE SECTION.
        01 LS-DICE-STR REDEFINES WS-DICE PIC X(5).
        01 FILL REDEFINES WS-DICE.
            05 FILL OCCURS 5 TIMES.
                 15 LS-DIE-TABLE PIC 9(1).
        01 LS-DIE PIC 9(1) VALUE ZERO.
        01 LS-DIE-IDX PIC 9(1) VALUE 1.
        01 LS-COUNTER-NUM PIC 9(6) VALUE ZEROES.
        01 LS-COUNTER-STR REDEFINES LS-COUNTER-NUM PIC X(6).
        01 FILL REDEFINES LS-COUNTER-NUM.
            05 FILL OCCURS 6 TIMES.
                10 LS-COUNTER PIC 9(1).
        
        
        
        PROCEDURE DIVISION.

        YACHT.
            INITIALIZE WS-RESULT LS-COUNTER-NUM
            
            EVALUATE WS-CATEGORY
                WHEN 'ones'
                    PERFORM SCORE-ONES
                WHEN 'twos'
                    PERFORM SCORE-TWOS
                WHEN 'threes'
                    PERFORM SCORE-THREES
                WHEN 'fours'
                    PERFORM SCORE-FOURS
                WHEN 'fives'
                    PERFORM SCORE-FIVES
                WHEN 'sixes'
                    PERFORM SCORE-SIXES
                WHEN 'four of a kind'
                    PERFORM SCORE-FOUR-OF-A-KIND
                WHEN 'full house'
                    PERFORM SCORE-FULL-HOUSE
                WHEN 'little straight'
                    PERFORM SCORE-LITTLE-STRAIGHT
                WHEN 'big straight'
                    PERFORM SCORE-BIG-STRAIGHT
                WHEN 'choice'
                    PERFORM SCORE-CHOICE
                WHEN 'yacht'
                    PERFORM SCORE-YACHT
            END-EVALUATE.
            

        SCORE-ONES.        
            MOVE 1 TO LS-DIE 
            PERFORM SUM-EQUAL-TO-DIE.
            
        SCORE-TWOS.
            MOVE 2 TO LS-DIE 
            PERFORM SUM-EQUAL-TO-DIE.
            
        SCORE-THREES.
            MOVE 3 TO LS-DIE 
            PERFORM SUM-EQUAL-TO-DIE.
            
        SCORE-FOURS.
            MOVE 4 TO LS-DIE 
            PERFORM SUM-EQUAL-TO-DIE.
            
        SCORE-FIVES.
            MOVE 5 TO LS-DIE 
            PERFORM SUM-EQUAL-TO-DIE.
            
        SCORE-SIXES.
            MOVE 6 TO LS-DIE 
            PERFORM SUM-EQUAL-TO-DIE.
            
        SUM-EQUAL-TO-DIE.
            INSPECT LS-DICE-STR TALLYING WS-RESULT FOR ALL LS-DIE
            COMPUTE WS-RESULT = WS-RESULT * LS-DIE.


        SCORE-FOUR-OF-A-KIND.
            PERFORM COUNT-DICE
            PERFORM VARYING LS-DIE-IDX FROM 1 BY 1 UNTIL LS-DIE-IDX > 6
                IF LS-COUNTER(LS-DIE-IDX) >= 4
                    COMPUTE WS-RESULT = 4 * LS-DIE-IDX
                END-IF
            END-PERFORM.

        SCORE-LITTLE-STRAIGHT.
            PERFORM COUNT-DICE
            IF LS-COUNTER-STR = "111110" THEN
                MOVE 30 TO WS-RESULT
            END-IF.

        SCORE-BIG-STRAIGHT.
            PERFORM COUNT-DICE
            IF LS-COUNTER-STR = "011111" THEN
                MOVE 30 TO WS-RESULT
            END-IF.

        SCORE-FULL-HOUSE.
            PERFORM COUNT-DICE
            MOVE 0 TO LS-DIE
            PERFORM VARYING LS-DIE-IDX FROM 1 BY 1 UNTIL LS-DIE-IDX > 6
                IF LS-COUNTER(LS-DIE-IDX) = 2 THEN
                    MOVE LS-DIE-IDX TO LS-DIE
                END-IF
                IF LS-COUNTER(LS-DIE-IDX) = 3 THEN
                    MOVE LS-DIE-IDX TO WS-RESULT
                END-IF
            END-PERFORM
            IF LS-DIE > 0 AND WS-RESULT > 0 THEN
                COMPUTE WS-RESULT = (2 * LS-DIE) + (3 * WS-RESULT)
            ELSE
                MOVE ZERO TO WS-RESULT
            END-IF.
                        
        COUNT-DICE.
            PERFORM VARYING LS-DIE-IDX FROM 1 BY 1 UNTIL LS-DIE-IDX > 5
                MOVE LS-DIE-TABLE(LS-DIE-IDX) TO LS-DIE
                COMPUTE LS-COUNTER(LS-DIE) =  LS-COUNTER(LS-DIE) + 1
            END-PERFORM.


        SCORE-CHOICE.
            PERFORM VARYING LS-DIE-IDX FROM 1 BY 1 UNTIL LS-DIE-IDX > 5
                COMPUTE WS-RESULT = WS-RESULT + LS-DIE-TABLE(LS-DIE-IDX)
            END-PERFORM.

        SCORE-YACHT.
            MOVE LS-DIE-TABLE(1) TO LS-DIE
            IF LS-DIE * 11111 = WS-DICE THEN
                MOVE 50 TO WS-RESULT
            END-IF.