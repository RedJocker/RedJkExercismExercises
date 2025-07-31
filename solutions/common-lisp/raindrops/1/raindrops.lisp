
(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defun convert (n)
  (let ((sound-map '((3 . "Pling") (5 . "Plang") (7 . "Plong"))))
    (let ((sound (apply #'concatenate 'string
			 (map 'list (lambda (p) (if (zerop (rem n (car p)))
					       (cdr p)
					       ""))
			      sound-map))))
      (if (string-equal "" sound)
	  (write-to-string n)
	  sound))))
	       
