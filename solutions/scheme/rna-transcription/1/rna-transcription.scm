(import (rnrs))

(define (dna->rna dna)
  (string-map (lambda (char)
		(define (equal-to-char? x)
		  (char-ci=? x char))
		(cond ((equal-to-char? #\G) #\C)
		      ((equal-to-char? #\C) #\G)
		      ((equal-to-char? #\T) #\A)
		      ((equal-to-char? #\A) #\U)))
	      dna))

