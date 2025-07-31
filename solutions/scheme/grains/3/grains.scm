(import (rnrs))

(define (square n)
  (when (or (not  (<= 1 n 64))  (not (= (mod n 1) 0)))  
    (throw 'wrong-type-arg square "arg must be integer between 1 and 64"))
  (expt 2 (1- n)))

(define (total)
  (define* (recursive-summing #:optional (count 1) ( acc 0))
    (if (= count 65)
        acc
        (recursive-summing (1+ count) (+ acc (square count)))))
  (recursive-summing))

