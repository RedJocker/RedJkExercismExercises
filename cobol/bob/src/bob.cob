
        IDENTIFICATION DIVISION.
        PROGRAM-ID. BOB.
        
        ENVIRONMENT DIVISION.
        CONFIGURATION SECTION.
        SPECIAL-NAMES.
            CLASS UPPER IS "A" THRU "Z".
            CLASS LOWER IS "a" THRU "z".
        
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-HEYBOB                PIC X(60).
        01 WS-RESULT                PIC X(40).
            88 SURE VALUE "Sure.".
            88 CHILL-OUT VALUE "Whoa, chill out!".
            88 CALM-DOWN VALUE "Calm down, I know what I'm doing!".
            88 FINE VALUE "Fine. Be that way!".
            88 WHATEVER VALUE "Whatever.".

        LOCAL-STORAGE SECTION.
        01 LS-LAST-CHAR-IDX PIC 9(3) VALUE ZEROS.
        01 IDX PIC 9(3).
        01 LS-PHRASE-FLAG PIC S9(1) VALUE -1.
            88 IS-BLANK VALUE -1.
            88 IS-NOT-BLANK VALUE 0 THRU 7.
            88 HAS-UPPER VALUE 1, 3, 5, 7.
            88 HAS-LOWER VALUE 2, 3, 6, 7.
            88 ENDS-QUESTION VALUE 4, 5, 6, 7.
            

        PROCEDURE DIVISION.
        BOB.
            PERFORM BOB-PHRASE-ANALISYS
            EVALUATE TRUE
                WHEN IS-BLANK
                    SET FINE TO TRUE
                WHEN HAS-UPPER AND HAS-LOWER AND ENDS-QUESTION
                    SET SURE TO TRUE
                WHEN HAS-UPPER AND HAS-LOWER
                    SET WHATEVER TO TRUE
                WHEN HAS-UPPER AND ENDS-QUESTION
                    SET CALM-DOWN TO TRUE
                WHEN HAS-UPPER
                    SET CHILL-OUT TO TRUE
                WHEN IS-NOT-BLANK AND ENDS-QUESTION
                    SET SURE TO TRUE
                WHEN IS-NOT-BLANK
                    SET WHATEVER TO TRUE
            END-EVALUATE.

        BOB-PHRASE-ANALISYS.
            MOVE -1 TO LS-PHRASE-FLAG
            PERFORM PARSE-BLANK
            PERFORM PARSE-SENTENCE
            PERFORM CHECK-QUESTION.
            
        PARSE-BLANK.
            PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 60 OR IS-NOT-BLANK
                IF WS-HEYBOB(IDX:1) IS = SPACE THEN
                    CONTINUE
                ELSE
                    MOVE 0 TO LS-PHRASE-FLAG
                END-IF 
            END-PERFORM
      *                              IDX IS SET FOR PARSE-SENTENCE CONTINUATION
            COMPUTE IDX = IDX - 1.
            
        PARSE-SENTENCE.
            PERFORM VARYING IDX FROM IDX BY 1 UNTIL IDX > 60
                EVALUATE WS-HEYBOB(IDX:1)
                    WHEN IS UPPER
                        IF NOT HAS-UPPER
                            COMPUTE LS-PHRASE-FLAG = LS-PHRASE-FLAG + 1
                        END-IF
                        MOVE IDX TO LS-LAST-CHAR-IDX
                    WHEN IS LOWER
                        IF NOT HAS-LOWER
                            COMPUTE LS-PHRASE-FLAG = LS-PHRASE-FLAG + 2
                        END-IF
                        MOVE IDX TO LS-LAST-CHAR-IDX
                    WHEN = SPACE
                        CONTINUE
                    WHEN OTHER
                        MOVE IDX TO LS-LAST-CHAR-IDX
                END-EVALUATE
            END-PERFORM.
            
        CHECK-QUESTION.
            IF WS-HEYBOB(LS-LAST-CHAR-IDX:1) = "?"
                COMPUTE LS-PHRASE-FLAG = LS-PHRASE-FLAG + 4
            END-IF.
