(in-package #:cl-user)
(defpackage #:rna-transcription
  (:use #:cl)
  (:export #:to-rna))
(in-package #:rna-transcription)

(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
  (labels ((transcriber (char)
                       (case char
                         (#\G #\C)
                         (#\C #\G)
                         (#\T #\A)
                         (#\A #\U)
                         (otherwise
                            (error "Invalid nuleotide '~C\' on dna string" char)))))
    (map 'string #'transcriber str)))
                             
 
