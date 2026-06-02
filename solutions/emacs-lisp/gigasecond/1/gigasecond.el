;;; gigasecond.el --- Gigasecond (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun add (second minute hour day month year)
  (let ((gigatime
	 (encode-time (+ second 1000000000) minute hour day month year)))
    gigatime)


(provide 'gigasecond)
;;; gigasecond.el ends here

