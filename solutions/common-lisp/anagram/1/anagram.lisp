(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun curry (func arg1)
  (lambda (arg2) (funcall func arg1 arg2)))

(defun compose (func1 func2)
  (lambda (arg) (funcall func1 (funcall func2 arg))))

(defun anagramp (str1 str2)
  (and
   (not (string-equal str1 str2))
   (string-equal (sort (copy-seq str1) #'char-lessp) (sort (copy-seq str2) #'char-lessp))))

(defun anagrams-for (subject candidates)
  "Returns a sublist of candidates which are anagrams of the subject."
  (labels ((predicate(arg)(funcall (compose #'not (curry #'anagramp subject)) arg)))
    
    (remove-if #'predicate candidates)))

