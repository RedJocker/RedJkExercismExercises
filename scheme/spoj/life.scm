(define (println arg) 
	(display arg)
	(newline))

(define (echo)
  (let ((input (read)))
    (when (not (= 42 input)) (println input))
    (when (not (= 42 input)) (echo))))

(echo)


