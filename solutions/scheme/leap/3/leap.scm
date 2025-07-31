(import (rnrs))

(define (leap-year? year)
  (define (is-year-divisible-by? x)
    (= 0 (modulo year  x)))
  
  (and (is-year-divisible-by? 4)
       (or (is-year-divisible-by? 400)
	   (not (is-year-divisible-by? 100)))))



