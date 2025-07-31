
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YACHT.
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       01 WS-RESULT PIC 9(2) VALUE ZEROS.
       01 WS-CATEGORY PIC X(15).
       01 WS-DICE PIC 9(5) VALUE ZEROS.
       LOCAL-STORAGE SECTION.
       01 LS-DICE-STR REDEFINES WS-DICE PIC X(5).
       01 LS-DIE PIC 9(1) VALUE ZERO.
       01 LS-IS-CATEGORY PIC 9(1) VALUE 1.
       01 LS-DICE-IDX PIC 9(1) VALUE 1.
       
       PROCEDURE DIVISION.
       
       YACHT.
           MOVE ZEROS TO WS-RESULT
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
                   PERFORM SCORE-YATCH
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
           PERFORM IS-FOUR-OF-A-KIND
           COMPUTE WS-RESULT = 4 * LS-DIE * LS-IS-CATEGORY. 
       IS-FOUR-OF-A-KIND.
           PERFORM VARYING LS-DICE-IDX FROM 1 BY 1 UNTIL LS-DICE-IDX > 2
               MOVE 0 TO LS-IS-CATEGORY
               MOVE FUNCTION NUMVAL-C(LS-DICE-STR(LS-DICE-IDX:1)) TO LS-DIE
               INSPECT LS-DICE-STR TALLYING LS-IS-CATEGORY FOR ALL LS-DIE
               IF LS-IS-CATEGORY >= 4 THEN
                   MOVE 1 TO LS-IS-CATEGORY
                   EXIT PARAGRAPH
           END-PERFORM
           MOVE 0 TO LS-IS-CATEGORY.
           
       SCORE-FULL-HOUSE.
           PERFORM IS-FULL-HOUSE
           COMPUTE WS-RESULT = LS-IS-CATEGORY * ((3 * WS-RESULT) + (2 * LS-DIE)).
       IS-FULL-HOUSE.
           MOVE 0 TO LS-IS-CATEGORY
           MOVE FUNCTION NUMVAL-C(LS-DICE-STR(1:1)) TO LS-DIE
           INSPECT LS-DICE-STR TALLYING LS-IS-CATEGORY FOR ALL LS-DIE
           EVALUATE LS-IS-CATEGORY
               WHEN 3
                   DISPLAY "====THIS BRANCH IS NOT COVED BY TESTS====="
                   MOVE LS-DIE TO WS-RESULT
                   PERFORM VARYING LS-DICE-IDX FROM 2 BY 1 UNTIL LS-DICE-IDX > 5
                       MOVE FUNCTION NUMVAL-C(LS-DICE-STR(LS-DICE-IDX:1)) TO LS-DIE
                       IF LS-DIE NOT = WS-RESULT THEN
                           MOVE 0 TO LS-IS-CATEGORY
                           INSPECT LS-DICE-STR TALLYING LS-IS-CATEGORY FOR ALL LS-DIE
                           IF LS-IS-CATEGORY = 2 THEN
                               MOVE 1 TO LS-IS-CATEGORY
                           ELSE
                               MOVE 0 TO LS-IS-CATEGORY
                           END-IF
                           EXIT PARAGRAPH
                       END-IF
                   END-PERFORM
               WHEN 2
                   PERFORM VARYING LS-DICE-IDX FROM 2 BY 1 UNTIL LS-DICE-IDX > 5
                       MOVE FUNCTION NUMVAL-C(LS-DICE-STR(LS-DICE-IDX:1)) TO WS-RESULT
                       IF LS-DIE NOT =  WS-RESULT THEN
                           MOVE 0 TO LS-IS-CATEGORY
                           MOVE WS-RESULT TO LS-DICE-IDX
                           INSPECT LS-DICE-STR TALLYING LS-IS-CATEGORY FOR ALL LS-DICE-IDX
                           IF LS-IS-CATEGORY = 3 THEN
                               MOVE 1 TO LS-IS-CATEGORY
                           ELSE
                               MOVE 0 TO LS-IS-CATEGORY
                           END-IF
                           EXIT PARAGRAPH
                       END-IF
                   END-PERFORM
           END-EVALUATE
           MOVE 0 TO LS-IS-CATEGORY.


       SCORE-LITTLE-STRAIGHT.
           PERFORM BIN-SUM-DICE 
           IF WS-RESULT = 31
               MOVE 30 TO WS-RESULT
           ELSE
               MOVE 0 TO WS-RESULT.
               
       SCORE-BIG-STRAIGHT.
           PERFORM BIN-SUM-DICE 
           IF WS-RESULT = 62
               MOVE 30 TO WS-RESULT
           ELSE
               MOVE 0 TO WS-RESULT.
               
       BIN-SUM-DICE.
           PERFORM VARYING LS-DICE-IDX FROM 1 BY 1 UNTIL LS-DICE-IDX > 5
               MOVE FUNCTION NUMVAL-C(LS-DICE-STR(LS-DICE-IDX:1)) TO LS-DIE
               EVALUATE LS-DIE
                   WHEN 1
                       COMPUTE WS-RESULT = WS-RESULT + 1
                   WHEN 2
                       COMPUTE WS-RESULT = WS-RESULT + 2
                   WHEN 3
                       COMPUTE WS-RESULT = WS-RESULT + 4
                   WHEN 4
                       COMPUTE WS-RESULT = WS-RESULT + 8
                   WHEN 5
                       COMPUTE WS-RESULT = WS-RESULT + 16
                   WHEN 6
                       COMPUTE WS-RESULT = WS-RESULT + 32
               END-EVALUATE
           END-PERFORM.


       SCORE-CHOICE.
           PERFORM SUM-DICE.
           
       SUM-DICE.
           PERFORM VARYING LS-DICE-IDX FROM 1 BY 1 UNTIL LS-DICE-IDX > 5
               MOVE FUNCTION NUMVAL-C(LS-DICE-STR(LS-DICE-IDX:1)) TO LS-DIE
               COMPUTE WS-RESULT = WS-RESULT + LS-DIE
           END-PERFORM.

       SCORE-YATCH.
           PERFORM IS-YATCH
           COMPUTE WS-RESULT = 50 * LS-IS-CATEGORY.
       IS-YATCH.
           MOVE FUNCTION NUMVAL-C(LS-DICE-STR(1:1)) TO LS-DIE
           IF LS-DIE * 11111 = WS-DICE THEN
               MOVE 1 TO LS-IS-CATEGORY
           ELSE
               MOVE 0 TO LS-IS-CATEGORY
           END-IF.
           