(in-package #:cl-user)
(defpackage #:acronym
  (:use #:common-lisp)
  (:export #:acronym))

(in-package #:acronym)

(defun acronym(string &optional (index 0)(appnd T) (acc '()))
  
  (when (>= index (1- (length string)))(return-from acronym  (string-upcase (coerce acc 'string))))
  (let ((curChar (aref string index)))
    (cond ((or (char< curChar #\A) (char> curChar #\z)) (acronym string (1+ index) T  acc))
	  ((and (char> curChar #\Z) (char< curChar #\a)) (acronym string (1+ index) T acc))
	  ( appnd (acronym string (1+ index) nil `(,@acc ,(aref string index))))
	  ( T (acronym string (1+ index) nil acc))
    )
  )	  
)
