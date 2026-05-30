;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun digits(num)
  """Converts a positive number to a list of digits"""
  (cl-labels ((digits-helper (n acc)
                (if (= 0 n)
                    acc
                  (let ((digit (mod n 10))
                        (next (/ n 10)))
                    (digits-helper next (cons digit acc))))))
    (digits-helper num nil)))

(defun digits(num)
  """Converts a positive number to a list of digits"""
  (cl-labels ((digits-helper (n acc)
                (if-let* ((digit (mod n 10))
                          (next (/ n 10))
                          (guard (not (= 0 n))))
                    (digits-helper next (cons digit acc))
                  acc)))
    (digits-helper num nil)))


(defun armstrong-p (n)
  (let* ((digits (digits n))
         (len-digits (length digits))
         (raised (mapcar (lambda (a) (expt a len-digits)) digits))
         (sum (apply #'+ raised)))
    (= sum n)))


(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
