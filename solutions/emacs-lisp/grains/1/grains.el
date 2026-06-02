;;; grains.el --- Grains exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defun square (n)
  (expt 2 (1- n)))

(defun total ()
  (1- (* (square 64) 2)))

(provide 'grains)
;;; grains.el ends here
