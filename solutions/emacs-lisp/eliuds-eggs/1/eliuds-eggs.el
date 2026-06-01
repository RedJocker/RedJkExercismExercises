;;; eliuds-eggs.el --- Eliud's Eggs (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun egg-count (number)
  (cl-labels
      ((counter (current-number acc-count)
	 (if-let* ((guard (not (zerop current-number)))
		   (next-number (/ current-number 2))
		   (digit (mod current-number 2)))
	     (counter  next-number (+ acc-count digit))
	   acc-count)))
    (counter number 0)))

(provide 'eliuds-eggs)
;;; eliuds-eggs.el ends here


