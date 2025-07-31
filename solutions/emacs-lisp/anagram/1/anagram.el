;;; anagram.el --- Anagram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'cl-lib)

(defun anagrams-for (subject candidates)
  "Return a list containg only the elements of CANDIDATES that are anagram of SUBJECT."
  (seq-filter (apply-partially #'anagram-p subject) candidates))


(defun anagram-p (subject candidate)
  "Predicate that test for anagram.

Return t if CANDIDATE is an anagram, that is, is an rearrangement
of the same set of letter found in SUBJECT."
  (when (not (string-equal-ignore-case subject candidate))
    (let ((sort-subject (sort-string (upcase subject) #'>))
	  (sort-canditate (sort-string (upcase candidate) #'>)))
      (string-equal sort-subject sort-canditate))))

(defun sort-string (str predicate)
  "Sort chars from STR using PREDICATE."
  (cl-coerce
   (sort (cl-coerce str 'list) predicate)
   'string))

(provide 'anagram)
;;; anagram.el ends here
