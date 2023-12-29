(in-package #:cl-user)
(defpackage #:acronym
  (:use #:common-lisp)
  (:export #:acronym))

(in-package #:acronym)

(defun acronym(string &optional (index 0)(append-p t) acc)
  
  (if (>= index (1- (length string)))
      (reverse (coerce acc 'string))
      (let* ((cur-char (char-upcase (aref string index)))
	    (is-alpha-p (upper-case-p cur-char)))
        (acronym string
		 (1+ index)
		 (not is-alpha-p)
		 (if (and append-p is-alpha-p) (cons cur-char acc) acc)))))
    
      
