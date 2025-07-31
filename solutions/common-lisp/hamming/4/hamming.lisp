(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun distance (dna1 dna2)
  "Number of positional differences in two equal length dna strands."
  (when (= (length dna1) (length dna2))
    (labels ((make-counter  ()
	       (let ((count 0))
		 (lambda () (incf count)))))
      (let ((counter (make-counter)))
	(map nil #'(lambda (x y)
		     (when (char/= x y) (funcall counter)))
	     dna1
	     dna2)
	(1- (funcall counter))))))
      
	       
    
    
	      
