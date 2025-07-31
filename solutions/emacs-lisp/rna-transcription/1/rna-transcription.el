;;; rna-transcription.el -- RNA Transcription (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'cl-lib)

(defun to-rna (strand)
  "Convert STRAND, a dna sequence of nucleotides, into its counterpart rna strand."
  (seq-into (seq-map #'nucleotide-to-rna strand) 'string))

(defun nucleotide-to-rna (nucleotide)
  "Convert NUCLEOTIDE, a dna nucleotide, into its counterpart rna nucleotide."
  (cl-case nucleotide
    ((?G ?g) ?C)
    ((?C ?c) ?G)
    ((?T ?t) ?A)
    ((?A ?a) ?U)
    (t (throw :illegal-argument (format "invalid nucleotide %c" nucleotide)))))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
