(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun distance (dna1 dna2)
  "Number of positional differences in two equal length dna strands."
  (when (= (length dna1) (length dna2))
    (apply #'+ 
           (map 'list #'(lambda(c1 c2) (if (char/= c1 c2) 1 0)) dna1 dna2))))
           
      
	       
    
    
	      
