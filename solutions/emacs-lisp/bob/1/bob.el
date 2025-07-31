;;; bob.el --- Bob exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun response-for (phrase)
  "PHRASE."
  (let ((case-fold-search nil)
	(one-line-phrase (string-replace "\n" " " phrase)))
    (let ((uppercase-p (re-match-p  "^[^a-z]*[A-Z]+[^a-z]+$" one-line-phrase))
	  (question-p (re-match-p "^.*[?][\s\t\r]*$" one-line-phrase)))
      (cond
       ((and uppercase-p question-p) "Calm down, I know what I'm doing!")
       (uppercase-p "Whoa, chill out!")
       (question-p "Sure.")
       ((re-match-p "^[\s\t\r]*$" one-line-phrase) "Fine. Be that way!")
       (t "Whatever.")))))

(defun re-match-p (pattern str)
  (equal 0 (string-match-p pattern str))))



(provide 'bob)
;;; bob.el ends here
