(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (number)
  (when (> number 0)
    (labels
	((collatz-iteration(num i)
	   (cond ((= 1 num) i)
		 ((evenp num) (collatz-iteration (/ num 2) (1+ i)))
		 (t (collatz-iteration (1+ (* 3 num)) (1+ i))))))
      (collatz-iteration number 0))))
