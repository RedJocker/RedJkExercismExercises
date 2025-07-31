(in-package #:cl-user)
(defpackage #:acronym
  (:use #:common-lisp)
  (:export #:acronym))

(in-package #:acronym)

(defun acronym(string &optional (index 0)(appnd T) (acc '()))
  
  (when (>= index (1- (length string)))(return-from acronym  (string-upcase (coerce acc 'string))))
  
  (let ((cur-char (aref string index)))
    
      (cond ((not (or (lower-case-p cur-char) (upper-case-p cur-char))) (acronym string (1+ index) t  acc))
	     (appnd (acronym string (1+ index) nil `(,@acc ,(aref string index))))
	     (t (acronym string (1+ index) nil acc)))))
