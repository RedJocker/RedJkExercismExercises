(import (rnrs))

(use-modules (srfi srfi-1)) ;; reduce, fold ...
(use-modules (ice-9 rdelim)) ;; read-line

(define (funcall fun)
  (fun))

(define (read-number-list)
    (map string->number (string-split (string-trim-both (read-line)) #\space)))

(define (soma-rest-example . args)
  (reduce + 0 args))

(define (range-between bottom top)
  (if (> bottom top)
      '()
      (cons bottom (range-between (1+ bottom) top))))


(define (hash-print table) 
  (hash-for-each
   (lambda (ch count) (simple-format #t "key: ~A value: ~A\n" ch count))
   table))

(define (hash-ref-or-else table key default)
  (let ((value (hash-ref table key)))
    (if (equal? #f value) default value)))

(define (make-histogram-hash str)
  (let ((table (make-hash-table)))
        (string-for-each (lambda (ch) (hashq-set! table ch (1+ (hash-ref-or-else table ch 0)))) str)
        table))

(define (hash-equal? table1 table2)
  (hash-fold
   (lambda (key value acc)
     (and
      acc
      (equal? value (hash-ref-or-else table2 key (lambda () 'unique-value)))))
   #t
   table1))

(define (zip . args)
  (apply map list `( ,@args)))

(define (read-all-input)
  (string-split (string-trim-both (read-delimited ""))  #\newline))
