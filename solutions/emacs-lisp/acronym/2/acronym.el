;;; acronym.el --- Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun acronym (phrase)
  (let ((words (string-split phrase "[\s_,-]" t)))
    (mapconcat (lambda(word) (upcase (substring word 0 1))) words)
    ))

(provide 'acronym)
;;; acronym.el ends here


