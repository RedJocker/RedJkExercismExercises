(defpackage :all-your-base
  (:use :cl)
  (:export :rebase))

(in-package :all-your-base)

(defun rebase (list-digits in-base out-base)
  (if (valid-rebase-p list-digits in-base out-base) 
      (ten-to-n-base (n-to-base-ten list-digits in-base) out-base)
      nil))

(defun valid-rebase-p (list-digits in-base out-base)
  (let ((is-valid-in-base (< 1 in-base))
        (is-valid-out-base (< 1 out-base))
        (is-valid-digits (every #'(lambda(digit) (< -1 digit in-base)) list-digits)))
    (and is-valid-in-base is-valid-out-base is-valid-digits)))

(defun n-to-base-ten (list-digits base)
  (labels
      ((n-to-base-ten-helper (list-digits-reversed base multiplier acc)
         (if (null list-digits-reversed)
             acc
             (destructuring-bind (current-digit . next-list-digits-reversed) list-digits-reversed
               (let ((next-multiplier (* base multiplier))
                     (next-acc (+ acc (* multiplier current-digit))))
                 (n-to-base-ten-helper next-list-digits-reversed base next-multiplier next-acc))))))
    (n-to-base-ten-helper (reverse list-digits) base 1 0)))

(defun ten-to-n-base (number base)
  (labels
      ((ten-to-n-base-helper (current-number acc)
         (if (zerop current-number)
             (if (null acc) '(0) acc) 
             (multiple-value-bind
                   (quotient remainder) (truncate current-number base)
               (ten-to-n-base-helper quotient (cons remainder acc))))))
    (ten-to-n-base-helper number '())))


