(defpackage :all-your-base
  (:use :cl)
  (:export :rebase))

(in-package :all-your-base)

(defun rebase (list-digits in-base out-base)
  (if (valid-rebase-p list-digits in-base out-base) 
      (number-to-base-n-representation
       (base-n-representation-to-number list-digits in-base)
       out-base)
      nil))

(defun valid-rebase-p (list-digits in-base out-base)
  (let ((is-valid-in-base (< 1 in-base))
        (is-valid-out-base (< 1 out-base))
        (is-valid-digits (every #'(lambda (digit) (< -1 digit in-base)) list-digits)))
    (and is-valid-in-base is-valid-out-base is-valid-digits)))

(defun base-n-representation-to-number (list-digits base)
  (reduce #'(lambda (acc cur-digit) (+ (* acc base) cur-digit)) list-digits :initial-value 0))

(defun number-to-base-n-representation (number base)
  (labels
      ((number-to-base-n-helper (current-number acc) 
         (if (<  current-number base)
             (cons current-number acc)
             (multiple-value-bind
                   (quotient remainder) (truncate current-number base)
               (number-to-base-n-helper quotient (cons remainder acc))))))
    (number-to-base-n-helper number '())))

