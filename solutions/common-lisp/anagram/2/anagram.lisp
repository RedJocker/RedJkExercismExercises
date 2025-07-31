(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun anagramp (str1)
  (let ((sortedStr1 (sort (copy-seq str1) #'char-lessp))
         (cStr1 (copy-seq str1)))
    (lambda(str2) 
      (and
       (not (string-equal cStr1 str2))
       (string-equal sortedStr1 (sort (copy-seq str2) #'char-lessp))))))

(defun anagrams-for (subject candidates)
  "Returns a sublist of candidates which are anagrams of the subject."
  (labels ((predicate(arg) (not (funcall (anagramp subject) arg))))
    
    (remove-if #'predicate candidates)))

