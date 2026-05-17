;;; acronym.el --- Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


;; (defun acronym (phrase)
;;   (let ((words (string-split phrase "[\s_,-]" t)))
;;     (mapconcat (lambda(word) (upcase (substring word 0 1))) words)
;;     ))

(defun acronym (phrase)
  (let ((separator "[\s_-]")
	    (omit-empty t)
	    (trim nil))
    (let ((words (split-string phrase separator omit-empty trim)))
      (cl-flet ((get-initial (str) (aref str 0)))
	    (upcase (concat (mapcar #'get-initial words)))))))

(provide 'acronym)
;;; acronym.el ends here


