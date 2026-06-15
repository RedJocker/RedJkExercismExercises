;;; isogram.el --- isogram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun isogramp (phrase)
  (define-hash-table-test '= #'= #'sxhash-eql)
  (let ((histogram (make-hash-table :test '=))
        (list-chars (string-to-list (downcase phrase))))
    (cl-labels ((inc-char (char)
                  (puthash char (1+ (gethash char histogram 0)) histogram))
                (chars-fold (chars)
                  (if-let* ((guard-empty (not (null chars)))
                            (current-char (car chars))
                            (guard-repeated-alpha
                             (or (<= (inc-char current-char) 1)
                                 (< current-char ?a)
                                 (> current-char ?z))))
                      (chars-fold (cdr chars))
                    (null chars))))
      (chars-fold list-chars))))


(provide 'isogram)
;;; isogram.el ends here
