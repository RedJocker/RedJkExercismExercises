;;; pangram.el --- Pangram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun pangramp (phrase)
  (define-hash-table-test '= #'= #'sxhash-equal)
  (let ((histogram (make-hash-table :test #'=))
        (phrase (downcase phrase)))
    (cl-labels ((insert-char(char)
                  (when (<= ?a char ?z)
                    (puthash
                     char
                     (gethash char histogram 0)
                     histogram))))
      (seq-do #'insert-char phrase)
      (= 26 (hash-table-count histogram)))))


(provide 'pangram)
;;; pangram.elcl ends here
