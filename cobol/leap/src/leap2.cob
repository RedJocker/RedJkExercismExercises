       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEAP.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-YEAR PIC 9(10).
       01 WS-RESULT PIC 9.
       01 WS-DIV PIC 9(10).
       01 WS-REM-400 PIC 9(10).
       01 WS-REM-100 PIC 9(10).
       01 WS-REM-4 PIC 9(10).
       PROCEDURE DIVISION.
       LEAP.
           DIVIDE WS-YEAR INTO 400 GIVING WS-DIV WS-REM-400.
           IF WS-REM-400 = 0 THEN
               GO TO RETURN-TRUE
           END-IF.
           DIVIDE WS-YEAR INTO 100 GIVING WS-DIV WS-REM-100.
           IF WS-REM-100 = 0 THEN
              GO TO RETURN-FALSE
           END-IF.
           DIVIDE WS-YEAR INTO 4 GIVING WS-DIV WS-REM-4.
           IF WS-REM-4 = 0 THEN
               GO TO RETURN-TRUE
           ELSE
               GO TO RETURN-FALSE
           END-IF.
           RETURN-TRUE.
               MOVE 1 TO WS-RESULT.
               GO TO LEAP-EXIT.
           RETURN-FALSE.
               MOVE 0 TO WS-RESULT.
               GO TO LEAP-EXIT.
       LEAP-EXIT.
            EXIT.
