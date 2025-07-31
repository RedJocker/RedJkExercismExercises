(import (rnrs))
(import (ice-9 hash-table))

(define (dna->rna dna)
  (define ht (alist->hash-table
	      '((#\G . #\C)
		(#\C . #\G)
		(#\T . #\A)
		(#\A . #\U))))
  
  (string-map (lambda (char)
		(if (hash-get-handle ht char)
		    (hash-ref ht char)
		    #\#))
	      dna))
		
		
		 

