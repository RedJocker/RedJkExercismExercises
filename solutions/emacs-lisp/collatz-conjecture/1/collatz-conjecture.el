;;; collatz-conjecture.el --- Collatz Conjecture (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun steps (number)
  "Count the steps to reach 1 using the Collatz conjecture."
  (if
      (<= number 0)
      (error "number %d should be greater than zero", number)
    (cl-labels
        ((collatz (num step)
           (cond
            ((= 1 num) step)
            ((= 0 (mod num 2)) (collatz (/ num 2) (1+ step)))
            (t (collatz (1+ (* 3 num)) (1+ step))))))
      (collatz number 0))))


(provide 'collatz-conjecture)
;;; collatz-conjecture.el ends here
