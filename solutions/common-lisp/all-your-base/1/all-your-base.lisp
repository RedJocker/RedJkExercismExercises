(defpackage :all-your-base
  (:use :cl)
  (:export :rebase))

(in-package :all-your-base)

(defun rebase (list-digits in-base out-base)
  (if (valid-rebase-p list-digits in-base out-base) 
      (ten-to-n-base (n-to-base-ten (if (null list-digits) '(0) list-digits) in-base) out-base)
      nil ))

(defun valid-rebase-p (list-digits in-base out-base)
  (let ((valid-in-base-p (< 1 in-base))
        (valid-out-base-p (< 1 out-base))
        (valid-digits-p (reduce #'(lambda(acc cur) (and acc (< -1 cur in-base))) list-digits :initial-value t)))
    (and valid-in-base-p valid-out-base-p valid-digits-p)))

(defun n-to-base-ten (list-digits base)
  (n-to-base-ten-helper (reverse list-digits) base 1 0))

(defun n-to-base-ten-helper (list-digits-reversed base multiplier acc)
  (if (null list-digits-reversed)
      acc
      (n-to-base-ten-helper (cdr list-digits-reversed) base (* base multiplier) (+ acc (* multiplier (car list-digits-reversed))))))

(defun ten-to-n-base (number base)
  (ten-to-n-base-helper number base '()))

(defun ten-to-n-base-helper(number base acc)
  (if (zerop number)
      (if (null acc) '(0) acc) 
      (multiple-value-bind
            (quotient remainder) (truncate number base)
        (ten-to-n-base-helper quotient base (cons remainder acc)))))
