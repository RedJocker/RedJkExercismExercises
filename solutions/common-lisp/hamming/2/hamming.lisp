(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun distance (dna1 dna2)
  "Number of positional differences in two equal length dna strands."
  (when (= (length dna1) (length dna2))
    (labels ((counter  (index acc)
	       (if (> index (1- (length dna1)))
		   acc
		   (let ((same-char-p (char= (aref dna1 index) (aref dna2 index))))
		     (counter (1+ index) (if same-char-p acc (1+ acc)))))))
      (counter 0 0))))
