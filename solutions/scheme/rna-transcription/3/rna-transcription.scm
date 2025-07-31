(import (rnrs))
(import (ice-9 hash-table))
(import (ice-9 control))

(define (dna->rna dna)
  (define ht (alist->hash-table
	      '((#\G . #\C)
		(#\C . #\G)
		(#\T . #\A)
		(#\A . #\U))))
  (call/ec
   (lambda (return)
     (string-map (lambda (char)
		   (if (hash-get-handle ht char)
		       (hash-ref ht char)
		       (return "Invalid DNA sting inputed. String can contain only G, C, T or A characters")))
		 dna))))
		
		
		 

