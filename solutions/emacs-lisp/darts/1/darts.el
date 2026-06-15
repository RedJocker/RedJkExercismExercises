;;; darts.el --- Darts (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun hypotenuse (x y)
  (sqrt (+ (expt x 2) (expt y 2))))

(defun score (x y)
  (let ((radius (hypotenuse x y)))
    (cond
     ((<= radius 1) 10)
     ((<= radius 5) 5)
     ((<= radius 10) 1)
     (t 0))))

(provide 'darts)
;;; darts.el ends here
