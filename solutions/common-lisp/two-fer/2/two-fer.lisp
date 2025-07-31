(in-package #:cl-user)
(defpackage #:two-fer
  (:use #:cl)
  (:export #:twofer))
(in-package #:two-fer)

(defun twofer (input)
  (let ((name (or input "you")))
    (format nil "One for ~A, one for me." name)))

