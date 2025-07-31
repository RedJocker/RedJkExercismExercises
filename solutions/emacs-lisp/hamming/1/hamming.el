;;; hamming.el --- Hamming (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'cl-lib)

(defun hamming-distance (dna1 dna2)
  (if (/= (length dna1) (length dna2))
      (throw :illegal-argument "strands must have same length")
    (seq-reduce
     #'+
     (cl-map 'list (lambda(a b) (if (equal a b) 0 1)) dna1 dna2)
     0)))

(provide 'hamming)
;;; hamming.el ends here
