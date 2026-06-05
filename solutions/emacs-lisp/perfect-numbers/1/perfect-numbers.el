;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defun factors-sum (number)
  (if (= 1 number)
      0
    (let ((candidate 2)
          (limit (/ number 2))
          (factors-sum 1))
      (while (<= candidate limit)
        (let ((rest (% number candidate)))
          (if (zerop rest)
              (let ((quotient (/ number candidate)))
                (incf factors-sum candidate)
                (unless (= candidate quotient)
                  (incf factors-sum quotient))
                (setq candidate (1+ candidate))
                (setq limit (1- quotient)))
            (setq candidate (1+ candidate)))))
      factors-sum)))

(defun classify (number)
  (when (<= number 0)
    (error "Classification is only possible for natural numbers"))
  (let ((factors-sum (factors-sum number)))
    (cond ((= factors-sum number) 'perfect)
          ((> factors-sum number) 'abundant)
          (t 'deficient))))

(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
