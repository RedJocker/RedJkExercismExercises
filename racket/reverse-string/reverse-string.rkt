#lang racket
(provide my-reverse)

(define (my-reverse s)
  ((compose list->string reverse string->list) s))

(define my-reverse2 (compose list->string (curry foldl cons '()) string->list))


(require srfi/13) ;; string-reverse, string-fold

(define my-reverse3 string-reverse)

(define my-reverse4 (compose (curry apply string) (curry string-fold cons '()))) 
