(import (rnrs))

(define (is-modulo-zero? x y)
  (= 0 (modulo x y)))

(define (leap-year? year)
  (and (is-modulo-zero? year 4)
       (or (is-modulo-zero? year 400)
	   (not (is-modulo-zero? year 100)))))



