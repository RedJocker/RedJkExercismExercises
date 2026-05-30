;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun digits(num)
  """Converts a positive number to a list of digits"""
  (cl-flet digits-helper (n acc) (if (= 0 n)
				    acc
				    (let ((digit (mod n 10))
					  (next (\ n 10)))
				      (digits-helper next (cons n acc)))))
    (digits-helper num nil))



(defun armstrong-p (n)
 (error "Delete this S-Expression and write your own implementation"))


(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
