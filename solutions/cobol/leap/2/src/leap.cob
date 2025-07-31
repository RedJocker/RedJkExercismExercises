       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEAP.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-YEAR PIC 9(10).
       01 WS-RESULT PIC 9 VALUE 0.
       01 WS-DIV PIC 9(10).
       01 WS-REM-400 PIC 9(10).
       01 WS-REM-100 PIC 9(10).
       01 WS-REM-4 PIC 9(10).
       PROCEDURE DIVISION.
       LEAP.
           DISPLAY "YEAR " WS-YEAR 
           DIVIDE WS-YEAR BY 400 GIVING WS-DIV REMAINDER WS-REM-400.
           IF WS-REM-400 EQUAL TO 0 THEN
               MOVE 1 TO WS-RESULT
           ELSE
               DIVIDE WS-YEAR BY 100 GIVING WS-DIV REMAINDER WS-REM-100
               DIVIDE WS-YEAR BY 4 GIVING WS-DIV REMAINDER WS-REM-4
               IF WS-REM-4 = 0 THEN
                   MOVE 1 TO WS-RESULT
               END-IF
               IF WS-REM-100 = 0 THEN
                   MOVE 0 TO WS-RESULT
               END-IF
           END-IF.
       LEAP-EXIT.
            DISPLAY "WS-REM-400 " WS-REM-400. 
            DISPLAY "WS-RESULT " WS-RESULT.
            EXIT.
