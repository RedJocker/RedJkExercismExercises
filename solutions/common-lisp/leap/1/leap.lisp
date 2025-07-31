(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

(defun leap-year-p (year)
  (or (zerop (rem year 400)) (and (not (zerop (rem year 100))) (zerop (rem year 4)))) )
