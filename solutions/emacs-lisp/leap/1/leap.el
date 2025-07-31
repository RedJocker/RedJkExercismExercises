;;; leap.el --- Leap exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(defun leap-year-p (year)
  "Predicate that return t if YEAR is a leap year else nil."
  (when (zerop (mod year 4))
    (or (not (zerop (mod year 100))) (zerop (mod year 400)))))

(provide 'leap-year-p)
;;; leap.el ends here
