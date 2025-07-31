(import (rnrs))

(define (leap-year? year)
  (and (= 0 (modulo year 4)) (or (= 0 (modulo year 400)) (not (= 0 (modulo year 100)))))) 

