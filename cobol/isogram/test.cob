                                                                                
        IDENTIFICATION DIVISION.                                                
        PROGRAM-ID. ISOGRAM.                                                    
        ENVIRONMENT DIVISION.                                                   
                                                                                
        DATA DIVISION.                                                          
        WORKING-STORAGE SECTION.                                                
      * CCHECKWS.CPY                                                            
       01  FILLER PIC X(32) VALUE '******* COBOLCHECK 0.0.1 *******'.           
       01  UT-FIELDS.                                                           
           05  UT-CONST-ES               PIC X(02) VALUE 'ES'.                  
           05  UT-LABEL-EXPECTED-ACCESS.                                        
               10  FILLER                PIC X(06) VALUE 'ACCESS'.              
               10  UT-LABEL-EXPECTED-ACCESS-PL                                  
                                         PIC X(02) VALUE SPACES.                
           05  UT-LABEL-VERIFY-COMPARE                                          
                                         PIC X(12) VALUE SPACES.                
           05  UT-VERIFY-COMPARE-STRINGS.                                       
               10  UT-VERIFY-EXACT-STRING                                       
                                         PIC X(05) VALUE 'EXACT'.               
               10  UT-VERIFY-AT-LEAST-STRING                                    
                                         PIC X(08) VALUE 'AT LEAST'.            
               10  UT-VERIFY-NO-MORE-THAN-STRING                                
                                         PIC X(12) VALUE 'NO MORE THAN'.        
           05  UT-DISPLAY-MESSAGE     PIC X(256) VALUE SPACES.                  
           05  FILLER                    PIC X(02) VALUE SPACES.                
               88  UT-RELATION-EQ               VALUE SPACES, 'EQ'.             
               88  UT-RELATION-GE               VALUE 'GE'.                     
               88  UT-RELATION-GT               VALUE 'GT'.                     
               88  UT-RELATION-LE               VALUE 'LE'.                     
               88  UT-RELATION-LT               VALUE 'LT'.                     
           05  FILLER                    PIC X(01) VALUE SPACES.                
               88  UT-NORMAL-COMPARE            VALUE 'N'.                      
               88  UT-REVERSE-COMPARE           VALUE 'Y'.                      
           05  FILLER                    PIC X(01) VALUE '1'.                   
               88  UT-VERIFY-EXACT              VALUE '1'.                      
               88  UT-VERIFY-AT-LEAST           VALUE '2'.                      
               88  UT-VERIFY-NO-MORE-THAN       VALUE '3'.                      
           05  FILLER                    PIC X(01) VALUE SPACES.                
               88  UT-VERIFY-PASSED      VALUE 'Y'.                             
               88  UT-VERIFY-FAILED      VALUE SPACES.                          
           05  FILLER                    PIC X(01) VALUE SPACES.                
               88  UT-ALPHANUMERIC-COMPARE VALUE SPACE.                         
               88  UT-NUMERIC-COMPARE    VALUE 'N'.                             
               88  UT-COMPARE-88-LEVEL   VALUE '8'.                             
           05  FILLER                    PIC X(01) VALUE SPACES.                
               88  UT-COMPARE-PASSED     VALUE 'Y'.                             
               88  UT-COMPARE-FAILED     VALUE SPACES.                          
           05  UT-EXPECTED               PIC X(256) VALUE SPACES.               
           05  UT-ACTUAL                 PIC X(256) VALUE SPACES.               
           05  UT-EXPECTED-NUMERIC-X.                                           
               10  UT-EXPECTED-NUMERIC   PIC S9(11)V9(7)                        
                                            COMP-3 VALUE ZERO.                  
           05  UT-ACTUAL-NUMERIC-X.                                             
               10  UT-ACTUAL-NUMERIC     PIC S9(11)V9(7)                        
                                            COMP-3 VALUE ZERO.                  
           05  FILLER                    PIC X     VALUE 'F'.                   
               88 UT-EXPECTED-88-VALUE             VALUE 'T', FALSE 'F'.        
           05  FILLER                    PIC X     VALUE 'F'.                   
               88 UT-ACTUAL-88-VALUE               VALUE 'T', FALSE 'F'.        
           05  UT-EXPECTED-ACCESSES      PIC 9(18) VALUE ZERO.                  
           05  UT-ACTUAL-ACCESSES        PIC 9(18) VALUE ZERO.                  
           05  UT-EXPECTED-ACCESSES-FMT  PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.           
           05  UT-ACTUAL-ACCESSES-FMT    PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.           
           05  UT-EXPECTED-ACCESSES-DISP PIC X(18).                             
           05  UT-ACTUAL-ACCESSES-DISP   PIC X(18).                             
           05  UT-FAILED                 PIC X(11)  VALUE "**** FAIL: ".        
           05  UT-PASSED                 PIC X(11)  VALUE "     PASS: ".        
           05  UT-TEST-SUITE-NAME        PIC X(80)  VALUE SPACES.               
           05  UT-TEST-CASE-NAME         PIC X(80)  VALUE SPACES.               
           05  UT-TEST-CASE-NUMBER       PIC ZZ9.                               
           05  UT-RETCODE                PIC 9(4)   VALUE ZERO.                 
           05  UT-TEST-CASE-COUNT        PIC 9(4)   VALUE ZERO COMP.            
           05  UT-NUMBER-PASSED          PIC 9(4)   VALUE ZERO COMP.            
           05  UT-NUMBER-FAILED          PIC 9(4)   VALUE ZERO COMP.            
           05  UT-EXPECTED-TRIM          PIC S9(5) COMP-3 VALUE ZERO.           
           05  UT-ACTUAL-TRIM            PIC S9(5) COMP-3 VALUE ZERO.           
       01  UT-MOCKS.                                                            
           05  FILLER                    PIC X(01) VALUE SPACES.                
               88  UT-MOCK-FOUND                   VALUE 'Y'.                   
               88  UT-MOCK-NOT-FOUND               VALUE SPACES.                
           05  UT-MOCK-FIND-TYPE         PIC X(04).                             
               88  UT-FIND-FILE-MOCK     VALUE 'FILE'.                          
               88  UT-FIND-CALL-MOCK     VALUE 'CALL'.                          
               88  UT-FIND-CICS-MOCK     VALUE 'CICS'.                          
               88  UT-FIND-SQL-MOCK      VALUE 'SQL'.                           
               88  UT-FIND-PARA-MOCK     VALUE 'PARA'.                          
           05  UT-MOCK-FIND-FILENAME     PIC X(31).                             
           05  UT-MOCK-FIND-PARA-NAME    PIC X(31).                             
           05  UT-MOCK-FIND-OPERATION    PIC X(04).                             
           05  UT-MOCK-FIND-CALL-TOKENS.                                        
               10  UT-MOCK-FIND-CALL-TOKEN OCCURS 25 PIC X(31).                 
           05  UT-MOCK-FIND-CICS-KEYWORDS.                                      
               10  UT-MOCK-FIND-CICS-KEYWORD OCCURS 25 PIC X(31).               
           05  UT-MOCK-SET-RECORD        PIC X(2048).                           
           05  UT-MOCK-SET-FILE-STATUS   PIC X(02).                             
           05  UT-MOCK-MAX               PIC 9(02) VALUE 10.                    
           05  UT-MOCK-COUNT             PIC 9(02) VALUE ZERO.                  
           05  UT-MOCK-OPERATION         PIC X(30).                             
           05  UT-MOCK OCCURS 20 INDEXED BY UT-MOCK-IX.                         
               10  UT-MOCK-TYPE          PIC X(04).                             
                   88  UT-MOCK-FILE          VALUE 'FILE'.                      
                   88  UT-MOCK-CALL          VALUE 'CALL'.                      
                   88  UT-MOCK-CICS          VALUE 'CICS'.                      
                   88  UT-MOCK-SQL           VALUE 'SQL'.                       
                   88  UT-MOCK-PARA          VALUE 'PARA'.                      
               10  UT-MOCK-ACCESS-COUNT    PIC 9(04) VALUE ZERO.                
               10  UT-MOCK-RECORD        PIC X(8192).                           
               10  UT-MOCK-DATA          PIC X(806).                            
               10  UT-MOCK-FILE-DATA REDEFINES UT-MOCK-DATA.                    
                   15  UT-MOCK-FILENAME       PIC X(31).                        
                   15  UT-MOCK-FILE-STATUS    PIC X(02).                        
                   15  FILLER                 PIC X(753).                       
               10  UT-MOCK-CALL-DATA REDEFINES UT-MOCK-DATA.                    
                   15  UT-MOCK-CALL-TOKENS-KEY PIC X(806).                      
               10  UT-MOCK-CICS-DATA REDEFINES UT-MOCK-DATA.                    
                   15  UT-MOCK-CICS-KEYWORDS-KEY PIC X(806).                    
               10  UT-MOCK-PARA-DATA REDEFINES UT-MOCK-DATA.                    
                   15  UT-MOCK-PARA-NAME  PIC X(31).                            
                   15  FILLER             PIC X(775).                           
               10  UT-MOCK-SQL-DATA REDEFINES UT-MOCK-DATA.                     
                   15  FILLER             PIC X(806).                           
       01  UT-FILES.                                                            
           05  UT-FILE-MAX                   PIC 9(02) VALUE 10.                
           05  UT-FILE-COUNT                 PIC 9(02) VALUE ZERO.              
           05  FILLER                        PIC X(01) VALUE SPACE.             
               88  UT-FILENAME-MATCHED       VALUE 'Y'.                         
               88  UT-FILENAME-NOT-MATCHED   VALUE 'N'.                         
           05  UT-FILE-INFORMATION.                                             
               10  FILLER OCCURS 10 INDEXED BY UT-FILE-IX.                      
                   15  UT-INTERNAL-FILENAME      PIC X(31).                     
                   15  UT-RECORD-FIELD-NAME      PIC X(31).                     
                   15  UT-FILE-STATUS-FIELD-NAME PIC X(31).                     
                                                                                
      * CCHECKWS.CPY END                                                        
        01 WS-PHRASE PIC X(60).                                                 
        01 WS-RESULT PIC 99.                                                    
                                                                                
        LOCAL-STORAGE SECTION.                                                  
        01 PHRASE-IDX PIC 9(2) VALUE 1.                                         
        01 LS-HISTOGRAM-STR PIC X(26) VALUE ALL "0".                            
        01 LS-HISTOGRAM-TABLE REDEFINES LS-HISTOGRAM-STR.                       
            05 LS-HISTOGRAM PIC 9(1) OCCURS 26 TIMES.                           
                88 IS-COUNT-LESS-THAN-TWO VALUE 0, 1.                           
        01 LS-CHAR PIC X(1) VALUE " ".                                          
            88 IS-ALPHA VALUE 'A' THRU 'Z'.                                     
        01 LS-CHAR-NUM PIC 9(3) VALUE 0.                                        
                                                                                
                                                                                
        PROCEDURE DIVISION.                                                     
           PERFORM UT-INITIALIZE                                                
      *-------- "empty string"                                                  
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "empty string"                                                  
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE '' TO WS-PHRASE                                                
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 1 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "isogram with only lower case characters"                       
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "isogram with only lower case characters"                       
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 'isogram' TO WS-PHRASE                                         
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 1 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "word with one duplicated character"                            
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "word with one duplicated character"                            
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 'eleven' TO WS-PHRASE                                          
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 0 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "word with one duplicated character from the end of the         
      * alphabet"                                                               
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "word with one duplicated character from the end of the         
      -    "alphabet"                                                           
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 'zzyzx' TO WS-PHRASE                                           
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 0 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "longest reported english isogram"                              
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "longest reported english isogram"                              
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 'subdermatoglyphic' TO WS-PHRASE                               
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 1 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "word with duplicated character in mixed case"                  
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "word with duplicated character in mixed case"                  
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 'Alphabet' TO WS-PHRASE                                        
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 0 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "word with duplicated character in mixed case, lowercase        
      *  first"                                                                 
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "word with duplicated character in mixed case, lowercase        
      -    " first"                                                             
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 'alphAbet' TO WS-PHRASE                                        
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 0 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "hypothetical isogrammic word with hyphen"                      
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "hypothetical isogrammic word with hyphen"                      
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 'thumbscrew-japingly' TO WS-PHRASE                             
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 1 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "hypothetical word with duplicated character following h        
      * yphen"                                                                  
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "hypothetical word with duplicated character following h        
      -    "yphen"                                                              
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 'thumbscrew-jappingly' TO WS-PHRASE                            
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 0 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "isogram with duplicated hyphen"                                
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "isogram with duplicated hyphen"                                
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 'six-year-old' TO WS-PHRASE                                    
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 1 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "made-up name that is an isogram"                               
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "made-up name that is an isogram"                               
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 'Emily Jung Schwartzkopf' TO WS-PHRASE                         
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 1 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "duplicated character in the middle"                            
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "duplicated character in the middle"                            
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 'accentor' TO WS-PHRASE                                        
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 0 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "same first and last characters"                                
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "same first and last characters"                                
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 'angola' TO WS-PHRASE                                          
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 0 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "word with duplicated character and with two hyphens"           
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "word with duplicated character and with two hyphens"           
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 'up-to-date' TO WS-PHRASE                                      
            PERFORM ISOGRAM                                                     
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 0 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      * CCHECKRESULTPD.CPY                                                      
           DISPLAY SPACE                                                        
           MOVE UT-TEST-CASE-COUNT TO UT-TEST-CASE-NUMBER                       
           DISPLAY UT-TEST-CASE-NUMBER ' TEST CASES WERE EXECUTED'              
           MOVE UT-NUMBER-PASSED TO UT-TEST-CASE-NUMBER                         
           DISPLAY UT-TEST-CASE-NUMBER ' PASSED'                                
           MOVE UT-NUMBER-FAILED TO UT-TEST-CASE-NUMBER                         
           DISPLAY UT-TEST-CASE-NUMBER ' FAILED'                                
           DISPLAY "================================================="          
           MOVE UT-RETCODE TO RETURN-CODE                                       
           GOBACK.                                                              
                                                                                
      * CCHECKRESULTPD.CPY END                                                  
       UT-BEFORE-EACH.                                                          
      *****************************************************************         
      *This is performed before each Test Case                                  
      *****************************************************************         
           CONTINUE                                                             
           .                                                                    
                                                                                
       UT-AFTER-EACH.                                                           
      *****************************************************************         
      *This is performed after each Test Case                                   
      *****************************************************************         
           CONTINUE                                                             
           .                                                                    
                                                                                
       UT-INITIALIZE-MOCK-COUNT.                                                
      *****************************************************************         
      *Sets all global mock counters and expected count to 0                    
      *****************************************************************         
           CONTINUE                                                             
           .                                                                    
                                                                                
      * CCHECKPARAGRAPHSPD.CPY                                                  
       UT-CHECK-EXPECTATION.                                                    
      *****************************************************************         
      * COMPARE EXPECTED AND ACTUAL VALUES FOR EQUALITY.                        
      *****************************************************************         
           MOVE UT-TEST-CASE-COUNT TO UT-TEST-CASE-NUMBER                       
           PERFORM UT-COMPARE                                                   
           IF UT-COMPARE-PASSED                                                 
               PERFORM UT-DISPLAY-PASSED                                        
           ELSE                                                                 
               PERFORM UT-DISPLAY-FAILED                                        
           END-IF                                                               
           .                                                                    
                                                                                
       UT-COMPARE.                                                              
           SET UT-COMPARE-FAILED TO TRUE                                        
           IF UT-COMPARE-88-LEVEL                                               
               IF UT-COMPARE-88-LEVEL                                           
                   IF (UT-ACTUAL-88-VALUE                                       
                       AND UT-EXPECTED-88-VALUE)                                
                   OR (NOT UT-ACTUAL-88-VALUE                                   
                       AND NOT UT-EXPECTED-88-VALUE)                            
                       SET UT-COMPARE-PASSED TO TRUE                            
                   END-IF                                                       
               ELSE                                                             
                   IF UT-ACTUAL IS EQUAL TO UT-EXPECTED                         
                       SET UT-COMPARE-PASSED TO TRUE                            
                   END-IF                                                       
               END-IF                                                           
           ELSE                                                                 
               EVALUATE TRUE ALSO TRUE                                          
                   WHEN UT-NUMERIC-COMPARE ALSO UT-RELATION-EQ                  
                       IF UT-ACTUAL-NUMERIC                                     
                               EQUAL UT-EXPECTED-NUMERIC                        
                           SET UT-COMPARE-PASSED TO TRUE                        
                       END-IF                                                   
                   WHEN UT-NUMERIC-COMPARE ALSO UT-RELATION-GT                  
                       IF UT-ACTUAL-NUMERIC                                     
                               GREATER UT-EXPECTED-NUMERIC                      
                           SET UT-COMPARE-PASSED TO TRUE                        
                       END-IF                                                   
                   WHEN UT-NUMERIC-COMPARE ALSO UT-RELATION-GE                  
                       IF UT-ACTUAL-NUMERIC                                     
                               GREATER OR EQUAL UT-EXPECTED-NUMERIC             
                           SET UT-COMPARE-PASSED TO TRUE                        
                       END-IF                                                   
                   WHEN UT-NUMERIC-COMPARE ALSO UT-RELATION-LT                  
                       IF UT-ACTUAL-NUMERIC                                     
                               LESS UT-EXPECTED-NUMERIC                         
                           SET UT-COMPARE-PASSED TO TRUE                        
                       END-IF                                                   
                   WHEN UT-NUMERIC-COMPARE ALSO UT-RELATION-LE                  
                       IF UT-ACTUAL-NUMERIC                                     
                               LESS OR EQUAL UT-EXPECTED-NUMERIC                
                           SET UT-COMPARE-PASSED TO TRUE                        
                       END-IF                                                   
                   WHEN UT-ALPHANUMERIC-COMPARE ALSO UT-RELATION-EQ             
                       IF UT-ACTUAL                                             
                               EQUAL UT-EXPECTED                                
                           SET UT-COMPARE-PASSED TO TRUE                        
                        END-IF                                                  
                    WHEN UT-ALPHANUMERIC-COMPARE ALSO UT-RELATION-GT            
                        IF UT-ACTUAL                                            
                                GREATER UT-EXPECTED                             
                            SET UT-COMPARE-PASSED TO TRUE                       
                        END-IF                                                  
                    WHEN UT-ALPHANUMERIC-COMPARE ALSO UT-RELATION-GE            
                        IF UT-ACTUAL                                            
                                GREATER OR EQUAL UT-EXPECTED                    
                            SET UT-COMPARE-PASSED TO TRUE                       
                        END-IF                                                  
                    WHEN UT-ALPHANUMERIC-COMPARE ALSO UT-RELATION-LT            
                        IF UT-ACTUAL                                            
                                LESS UT-EXPECTED                                
                            SET UT-COMPARE-PASSED TO TRUE                       
                        END-IF                                                  
                    WHEN UT-ALPHANUMERIC-COMPARE ALSO UT-RELATION-LE            
                        IF UT-ACTUAL                                            
                                LESS OR EQUAL UT-EXPECTED                       
                            SET UT-COMPARE-PASSED TO TRUE                       
                        END-IF                                                  
                    WHEN OTHER                                                  
                        IF UT-ACTUAL EQUAL UT-EXPECTED                          
                            SET UT-COMPARE-PASSED TO TRUE                       
                        END-IF                                                  
               END-EVALUATE                                                     
           END-IF                                                               
           PERFORM UT-REVERSE-RESULT                                            
           .                                                                    
                                                                                
       UT-REVERSE-RESULT.                                                       
           IF UT-REVERSE-COMPARE                                                
               IF UT-COMPARE-PASSED                                             
                   SET UT-COMPARE-FAILED TO TRUE                                
               ELSE                                                             
                   SET UT-COMPARE-PASSED TO TRUE                                
               END-IF                                                           
           END-IF                                                               
           .                                                                    
                                                                                
       UT-DISPLAY-PASSED.                                                       
           ADD 1 TO UT-NUMBER-PASSED                                            
           DISPLAY UT-PASSED                                                    
                   UT-TEST-CASE-NUMBER '. '                                     
                   UT-TEST-CASE-NAME                                            
           .                                                                    
                                                                                
       UT-DISPLAY-FAILED.                                                       
           ADD 1 TO UT-NUMBER-FAILED                                            
           DISPLAY UT-FAILED                                                    
                   UT-TEST-CASE-NUMBER '. '                                     
                   UT-TEST-CASE-NAME                                            
           IF UT-NUMERIC-COMPARE                                                
               DISPLAY '    EXPECTED ' UT-EXPECTED-NUMERIC                      
                       ', WAS ' UT-ACTUAL-NUMERIC                               
           ELSE                                                                 
               MOVE ZERO TO UT-EXPECTED-TRIM                                    
               INSPECT FUNCTION REVERSE(UT-EXPECTED)                            
                   TALLYING UT-EXPECTED-TRIM                                    
                   FOR LEADING SPACES                                           
               SUBTRACT UT-EXPECTED-TRIM                                        
                   FROM LENGTH OF UT-EXPECTED                                   
                   GIVING UT-EXPECTED-TRIM                                      
               MOVE ZERO TO UT-ACTUAL-TRIM                                      
               INSPECT FUNCTION REVERSE(UT-ACTUAL)                              
                   TALLYING UT-ACTUAL-TRIM                                      
                   FOR LEADING SPACES                                           
               SUBTRACT UT-ACTUAL-TRIM                                          
                   FROM LENGTH OF UT-ACTUAL                                     
                   GIVING UT-ACTUAL-TRIM                                        
                                                                                
               DISPLAY '    EXPECTED <'                                         
                   UT-EXPECTED(1:UT-EXPECTED-TRIM)                              
                       '>, WAS <' UT-ACTUAL(1:UT-ACTUAL-TRIM) '>'               
           END-IF                                                               
           MOVE 4 TO UT-RETCODE                                                 
           .                                                                    
                                                                                
       UT-ASSERT-ACCESSES.                                                      
      *****************************************************************         
      * COMPARE THE NUMBER OF ACCESSES TO A MOCK WITH THE EXPECTED              
      * NUMBER OF ACCESSES.                                                     
      *****************************************************************         
           MOVE UT-TEST-CASE-COUNT TO UT-TEST-CASE-NUMBER                       
           MOVE UT-ACTUAL-ACCESSES TO UT-ACTUAL-ACCESSES-FMT                    
           MOVE UT-EXPECTED-ACCESSES TO UT-EXPECTED-ACCESSES-FMT                
           IF UT-EXPECTED-ACCESSES IS EQUAL TO 1                                
              MOVE SPACES TO UT-LABEL-EXPECTED-ACCESS-PL                        
           ELSE                                                                 
              MOVE UT-CONST-ES TO UT-LABEL-EXPECTED-ACCESS-PL                   
           END-IF                                                               
                                                                                
           SET UT-VERIFY-FAILED TO TRUE                                         
           EVALUATE TRUE                                                        
               WHEN UT-VERIFY-AT-LEAST                                          
                    MOVE UT-VERIFY-AT-LEAST-STRING TO                           
                        UT-LABEL-VERIFY-COMPARE                                 
                    IF UT-ACTUAL-ACCESSES IS GREATER THAN OR EQUAL TO           
                            UT-EXPECTED-ACCESSES                                
                        SET UT-VERIFY-PASSED TO TRUE                            
                    END-IF                                                      
               WHEN UT-VERIFY-NO-MORE-THAN                                      
                    MOVE UT-VERIFY-NO-MORE-THAN-STRING TO                       
                        UT-LABEL-VERIFY-COMPARE                                 
                    IF UT-ACTUAL-ACCESSES IS LESS THAN OR EQUAL TO              
                            UT-EXPECTED-ACCESSES                                
                        SET UT-VERIFY-PASSED TO TRUE                            
                    END-IF                                                      
               WHEN OTHER                                                       
                    MOVE UT-VERIFY-EXACT-STRING TO                              
                        UT-LABEL-VERIFY-COMPARE                                 
                    IF UT-ACTUAL-ACCESSES IS EQUAL TO                           
                            UT-EXPECTED-ACCESSES                                
                        SET UT-VERIFY-PASSED TO TRUE                            
                    END-IF                                                      
           END-EVALUATE                                                         
                                                                                
           MOVE FUNCTION TRIM(UT-EXPECTED-ACCESSES-FMT)                         
              TO UT-EXPECTED-ACCESSES-DISP                                      
           MOVE FUNCTION TRIM(UT-ACTUAL-ACCESSES-FMT)                           
              TO UT-ACTUAL-ACCESSES-DISP                                        
                                                                                
                                                                                
                                                                                
           IF UT-VERIFY-PASSED                                                  
               ADD 1 TO UT-NUMBER-PASSED                                        
               STRING                                                           
                    UT-PASSED   DELIMITED BY SIZE                               
                    UT-TEST-CASE-NUMBER '. ' DELIMITED BY SIZE                  
                    'VERIFY ' UT-LABEL-VERIFY-COMPARE DELIMITED BY '  '         
                    ' ' DELIMITED BY SIZE                                       
                    UT-EXPECTED-ACCESSES-DISP DELIMITED BY SPACE                
                    ' ' DELIMITED BY SIZE                                       
                    UT-LABEL-EXPECTED-ACCESS ' ' DELIMITED BY SIZE              
                    'TO ' UT-MOCK-OPERATION DELIMITED BY SIZE                   
                   INTO UT-DISPLAY-MESSAGE                                      
               END-STRING                                                       
               DISPLAY UT-DISPLAY-MESSAGE                                       
                                                                                
           ELSE                                                                 
               ADD 1 TO UT-NUMBER-FAILED                                        
               MOVE SPACES TO UT-DISPLAY-MESSAGE                                
               STRING                                                           
                   UT-FAILED                      DELIMITED BY SIZE             
                   UT-TEST-CASE-NUMBER            DELIMITED BY SIZE             
                   '. VERIFY ACCESSES TO '        DELIMITED BY SIZE             
                   UT-MOCK-OPERATION           DELIMITED BY SIZE                
                   INTO UT-DISPLAY-MESSAGE                                      
               END-STRING                                                       
               DISPLAY UT-DISPLAY-MESSAGE                                       
               MOVE SPACES TO UT-DISPLAY-MESSAGE                                
               STRING                                                           
                   '   EXPECTED '                 DELIMITED BY SIZE             
                   UT-LABEL-VERIFY-COMPARE DELIMITED BY '  '                    
                   ' ' DELIMITED BY SIZE                                        
                   UT-EXPECTED-ACCESSES-DISP       DELIMITED BY SPACE           
                   ' '                          DELIMITED BY SIZE               
                   UT-LABEL-EXPECTED-ACCESS       DELIMITED BY SPACE            
                   ', WAS '                       DELIMITED BY SIZE             
                   UT-ACTUAL-ACCESSES-DISP         DELIMITED BY SIZE            
                   INTO UT-DISPLAY-MESSAGE                                      
               END-STRING                                                       
               DISPLAY UT-DISPLAY-MESSAGE                                       
               MOVE 4 TO UT-RETCODE                                             
           END-IF                                                               
           .                                                                    
                                                                                
       UT-LOOKUP-FILE.                                                          
      *****************************************************************         
      * LOOK UP A FILE SPECIFICATION.                                           
      *****************************************************************         
           PERFORM VARYING UT-FILE-IX FROM 1 BY 1                               
               UNTIL UT-FILE-IX GREATER UT-FILE-MAX                             
               OR UT-INTERNAL-FILENAME(UT-FILE-IX)                              
                EQUAL UT-MOCK-FIND-FILENAME                                     
             CONTINUE                                                           
           END-PERFORM                                                          
           SET UT-FILE-IX DOWN BY 1                                             
           .                                                                    
       UT-INITIALIZE.                                                           
           MOVE SPACES TO UT-FILE-INFORMATION                                   
                                                                                
           .                                                                    
       UT-END.                                                                  
                                                                                
      * CCHECKPARAGRAPHSPD.CPY END                                              
                                                                                
                                                                                
        ISOGRAM.                                                                
            INITIALIZE LS-HISTOGRAM-STR                                         
            MOVE FUNCTION UPPER-CASE(WS-PHRASE) TO WS-PHRASE                    
            MOVE 1 TO WS-RESULT                                                 
            PERFORM COUNT-CHAR-CHECK-DUPLICATE                                  
                VARYING PHRASE-IDX FROM 1 BY 1                                  
                UNTIL PHRASE-IDX > 60 OR WS-RESULT = 0.                         
                                                                                
        COUNT-CHAR-CHECK-DUPLICATE.                                             
            MOVE WS-PHRASE(PHRASE-IDX:1) TO LS-CHAR                             
            IF IS-ALPHA                                                         
                COMPUTE LS-CHAR-NUM = FUNCTION ORD(LS-CHAR) - 65                
           COMPUTE LS-HISTOGRAM(LS-CHAR-NUM) = LS-HISTOGRAM(LS-CHAR-NUM)        
               + 1                                                              
                IF NOT IS-COUNT-LESS-THAN-TWO(LS-CHAR-NUM)                      
                    MOVE 0 TO WS-RESULT                                         
                END-IF                                                          
            END-IF.                                                             
