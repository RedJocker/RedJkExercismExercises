(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun distance (dna1 dna2)
  "Number of positional differences in two equal length dna strands."
  (when (= (length dna1) (length dna2))
     (reduce #'(lambda (acc cur)
	         (if cur acc (1+ acc)))
	     (map 'list #'char= dna1 dna2)
	     :initial-value 0)))
  
