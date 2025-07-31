(in-package #:cl-user)
(defpackage #:two-fer
  (:use #:cl)
  (:export #:twofer))
(in-package #:two-fer)

(defun twofer (&optional (input "you"))
  (let ((name (if (null input) "you" input)))
    (format nil "One for ~A, one for me." name)))

