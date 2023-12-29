                                                                                
        IDENTIFICATION DIVISION.                                                
        PROGRAM-ID. YACHT.                                                      
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
           PERFORM UT-INITIALIZE                                                
      *-------- "Yacht"                                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Yacht"                                                         
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 55555 TO WS-DICE                                               
            MOVE 'yacht' TO WS-CATEGORY                                         
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 50 TO UT-EXPECTED-NUMERIC                                       
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Not Yacht"                                                     
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Not Yacht"                                                     
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 13325 TO WS-DICE                                               
            MOVE 'yacht' TO WS-CATEGORY                                         
            PERFORM YACHT                                                       
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
      *-------- "Ones"                                                          
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Ones"                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 11135 TO WS-DICE                                               
            MOVE 'ones' TO WS-CATEGORY                                          
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 3 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Ones, out of order"                                            
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Ones, out of order"                                            
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 31151 TO WS-DICE                                               
            MOVE 'ones' TO WS-CATEGORY                                          
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 3 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "No ones"                                                       
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "No ones"                                                       
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 43655 TO WS-DICE                                               
            MOVE 'ones' TO WS-CATEGORY                                          
            PERFORM YACHT                                                       
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
      *-------- "Twos"                                                          
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Twos"                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 23456 TO WS-DICE                                               
            MOVE 'twos' TO WS-CATEGORY                                          
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 2 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Fours"                                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Fours"                                                         
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 14141 TO WS-DICE                                               
            MOVE 'fours' TO WS-CATEGORY                                         
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 8 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Yacht counted as threes"                                       
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Yacht counted as threes"                                       
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 33333 TO WS-DICE                                               
            MOVE 'threes' TO WS-CATEGORY                                        
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 15 TO UT-EXPECTED-NUMERIC                                       
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Yacht of 3s counted as fives"                                  
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Yacht of 3s counted as fives"                                  
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 33333 TO WS-DICE                                               
            MOVE 'fives' TO WS-CATEGORY                                         
            PERFORM YACHT                                                       
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
      *-------- "Fives"                                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Fives"                                                         
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 15353 TO WS-DICE                                               
            MOVE 'fives' TO WS-CATEGORY                                         
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 10 TO UT-EXPECTED-NUMERIC                                       
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Sixes"                                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Sixes"                                                         
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 23456 TO WS-DICE                                               
            MOVE 'sixes' TO WS-CATEGORY                                         
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 6 TO UT-EXPECTED-NUMERIC                                        
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Full house two small, three big"                               
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Full house two small, three big"                               
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 22444 TO WS-DICE                                               
            MOVE 'full house' TO WS-CATEGORY                                    
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 16 TO UT-EXPECTED-NUMERIC                                       
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Full house three small, two big"                               
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Full house three small, two big"                               
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 53353 TO WS-DICE                                               
            MOVE 'full house' TO WS-CATEGORY                                    
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 19 TO UT-EXPECTED-NUMERIC                                       
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Two pair is not a full house"                                  
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Two pair is not a full house"                                  
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 22445 TO WS-DICE                                               
            MOVE 'full house' TO WS-CATEGORY                                    
            PERFORM YACHT                                                       
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
      *-------- "Four of a kind is not a full house"                            
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Four of a kind is not a full house"                            
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 14444 TO WS-DICE                                               
            MOVE 'full house' TO WS-CATEGORY                                    
            PERFORM YACHT                                                       
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
      *-------- "Yacht is not a full house"                                     
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Yacht is not a full house"                                     
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 22222 TO WS-DICE                                               
            MOVE 'full house' TO WS-CATEGORY                                    
            PERFORM YACHT                                                       
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
      *-------- "Four of a Kind"                                                
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Four of a Kind"                                                
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 66466 TO WS-DICE                                               
            MOVE 'four of a kind' TO WS-CATEGORY                                
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 24 TO UT-EXPECTED-NUMERIC                                       
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Yacht can be scored as Four of a Kind"                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Yacht can be scored as Four of a Kind"                         
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 33333 TO WS-DICE                                               
            MOVE 'four of a kind' TO WS-CATEGORY                                
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 12 TO UT-EXPECTED-NUMERIC                                       
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Full house is not Four of a Kind"                              
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Full house is not Four of a Kind"                              
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 33355 TO WS-DICE                                               
            MOVE 'four of a kind' TO WS-CATEGORY                                
            PERFORM YACHT                                                       
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
      *-------- "Little Straight"                                               
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Little Straight"                                               
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 35412 TO WS-DICE                                               
            MOVE 'little straight' TO WS-CATEGORY                               
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 30 TO UT-EXPECTED-NUMERIC                                       
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Little Straight as Big Straight"                               
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Little Straight as Big Straight"                               
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 12345 TO WS-DICE                                               
            MOVE 'big straight' TO WS-CATEGORY                                  
            PERFORM YACHT                                                       
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
      *-------- "Four in order but not a little straight"                       
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Four in order but not a little straight"                       
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 11234 TO WS-DICE                                               
            MOVE 'little straight' TO WS-CATEGORY                               
            PERFORM YACHT                                                       
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
      *-------- "No pairs but not a little straight"                            
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "No pairs but not a little straight"                            
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 12346 TO WS-DICE                                               
            MOVE 'little straight' TO WS-CATEGORY                               
            PERFORM YACHT                                                       
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
      *-------- "Minimum is 1, maximum is 5, but not a little straight"         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Minimum is 1, maximum is 5, but not a little straight"         
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 11345 TO WS-DICE                                               
            MOVE 'little straight' TO WS-CATEGORY                               
            PERFORM YACHT                                                       
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
      *-------- "Big Straight"                                                  
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Big Straight"                                                  
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 46253 TO WS-DICE                                               
            MOVE 'big straight' TO WS-CATEGORY                                  
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 30 TO UT-EXPECTED-NUMERIC                                       
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Big Straight as little straight"                               
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Big Straight as little straight"                               
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 65432 TO WS-DICE                                               
            MOVE 'little straight' TO WS-CATEGORY                               
            PERFORM YACHT                                                       
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
      *-------- "No pairs but not a big straight"                               
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "No pairs but not a big straight"                               
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 65431 TO WS-DICE                                               
            MOVE 'big straight' TO WS-CATEGORY                                  
            PERFORM YACHT                                                       
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
      *-------- "Choice"                                                        
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Choice"                                                        
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 33566 TO WS-DICE                                               
            MOVE 'choice' TO WS-CATEGORY                                        
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 23 TO UT-EXPECTED-NUMERIC                                       
           SET UT-RELATION-EQ TO TRUE                                           
           PERFORM UT-CHECK-EXPECTATION                                         
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-AFTER-EACH                                                
      *-------- "Yacht as choice"                                               
           MOVE SPACES                                                          
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-BEFORE-EACH                                               
           MOVE "Yacht as choice"                                               
               TO UT-TEST-CASE-NAME                                             
           PERFORM UT-INITIALIZE-MOCK-COUNT                                     
            MOVE 22222 TO WS-DICE                                               
            MOVE 'choice' TO WS-CATEGORY                                        
            PERFORM YACHT                                                       
           ADD 1 TO UT-TEST-CASE-COUNT                                          
           SET UT-NORMAL-COMPARE TO TRUE                                        
           SET UT-NUMERIC-COMPARE TO TRUE                                       
           MOVE WS-RESULT TO UT-ACTUAL-NUMERIC                                  
           MOVE 10 TO UT-EXPECTED-NUMERIC                                       
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
