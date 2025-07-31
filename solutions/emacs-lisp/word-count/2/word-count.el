;;; word-count.el --- word-count Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'subr-x)


(defun word-count (sentence &optional acc)
  (if-let* ((match-p (string-match "\\b[[:alnum:]]+\\(?:'[[:alpha:]]+\\)?\\b" sentence))
	    (word-start (match-beginning 0))
	    (word-end (match-end 0))
	    (word (downcase (substring sentence word-start word-end)))
	    (value (alist-get word acc 0 nil #'equal)))
      (progn
	(setf (alist-get word acc 0 nil #'equal) (1+ value))
	(word-count (substring sentence word-end) acc))
    acc))


(provide 'word-count)
;;; word-count.el ends here
