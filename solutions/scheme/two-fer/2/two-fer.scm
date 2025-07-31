(import (rnrs))

(define* (two-fer #:optional (name "you"))
  (simple-format #f
		 "One for ~A, one for me."
		 (if (nil? name)
		     "you"
		     name)))


