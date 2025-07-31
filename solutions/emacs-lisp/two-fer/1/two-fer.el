;;; two-fer.el --- Two-fer Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defun two-fer (&optional name)
  (let ((you (or name "you")))
       (format "One for %s, one for me." you)))

(provide 'two-fer)
;;; two-fer.el ends here
