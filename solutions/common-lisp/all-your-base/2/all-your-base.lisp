(defpackage :all-your-base
  (:use :cl)
  (:export :rebase))

(in-package :all-your-base)

(defun rebase (list-digits in-base out-base)
  (if (valid-rebase-p list-digits in-base out-base) 
      (ten-to-n-base (n-to-base-ten list-digits in-base) out-base)
      nil ))

(defun valid-rebase-p (list-digits in-base out-base)
  (let ((is-valid-in-base (< 1 in-base))
        (is-valid-out-base (< 1 out-base))
        (is-valid-digits (reduce
                         #'(lambda(acc cur) (and acc (< -1 cur in-base)))
                         list-digits
                         :initial-value t)))
    (and is-valid-in-base is-valid-out-base is-valid-digits)))

(defun n-to-base-ten (list-digits base)
  (n-to-base-ten-helper (reverse list-digits) base 1 0))

(defun n-to-base-ten-helper (list-digits-reversed base multiplier acc)
  (if (null list-digits-reversed)
      acc
      (let ((next-list-digits-reversed (cdr list-digits-reversed))
            (next-multiplier (* base multiplier))
            (next-acc (+ acc (* multiplier (car list-digits-reversed)))))
        (n-to-base-ten-helper next-list-digits-reversed base next-multiplier next-acc))))

(defun ten-to-n-base (number base)
  (ten-to-n-base-helper number base '()))

(defun ten-to-n-base-helper(number base acc)
  (if (zerop number)
      (if (null acc) '(0) acc) 
      (multiple-value-bind
            (quotient remainder) (truncate number base)
        (ten-to-n-base-helper quotient base (cons remainder acc)))))
