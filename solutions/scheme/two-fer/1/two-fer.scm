(import (rnrs))

(define (two-fer . name)
  (simple-format #f
		 "One for ~A, one for me."
		 (if (nil? name)
		     "you"
		     (if (nil? (car name))
			 "you"
			 (car name)))))
		  


