(import (rnrs))
(import (srfi srfi-1))

(define (hamming-distance strand-a strand-b)
  (define (count-diference c1 c2 acc)
    (if (char-ci=? c1 c2)
	acc
	(1+ acc)))
  
  (if (not (equal? (string-length strand-a) (string-length strand-b)))
     (throw 'wrong-type-arg hamming-distance "Can't compare diferent length strands" #f)
      (let ((dna-a (string->list strand-a))
	    (dna-b (string->list strand-b)))
    
	(fold count-diference 0 dna-a dna-b)))) 






      
      
  

