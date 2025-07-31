(import (rnrs))

(define (ch-score ch)
  (cond
   ((string-any (char-set ch) "AEIOULNRST") 1)
   ((string-any (char-set ch) "DG") 2)
   ((string-any (char-set ch) "BCMP") 3)
   ((string-any (char-set ch) "FHVWY") 4)
   ((string-any (char-set ch) "K") 5)
   ((string-any (char-set ch) "JX") 8)
   ((string-any (char-set ch) "QZ") 10)))

(define (score word)
  (fold-left + 0 (map ch-score (string->list (string-upcase word)))))


