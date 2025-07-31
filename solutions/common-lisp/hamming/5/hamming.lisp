(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun distance (dna1 dna2)
  "Number of positional differences in two equal length dna strands."
  (when (= (length dna1) (length dna2))
    (let ((dif 0))
      (map nil
           (lambda (a b)
             (when (char/= a b)
               (incf dif)))
           dna1 dna2)
      dif)))
      
	       
    
    
	      
