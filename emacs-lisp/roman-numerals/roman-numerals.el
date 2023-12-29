;;; roman-numerals.el --- roman-numerals Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defconst roman-alist
  '((10 . (?I ?V ?X))
    (100 . (?X ?L ?C))
    (1000 . (?C ?D ?M))))

(defun to-roman (value)
  (to-roman--helper value 10 ""))

(defun to-roman--helper (value top-bound acc)
  (if (zerop value)
      acc
    (let ((roman-digits (alist-get top-bound roman-alist))
	  (mid-bound (/ top-bound 2))
	  (lower-bound (/ top-bound 10))
	  (digit-with-0s (mod value top-bound)))
      (let ((low-roman (car roman-digits))
	    (mid-roman (cadr roman-digits))
	    (high-roman (caddr roman-digits))
	    (next-top-bound (* 10 top-bound))
	    (next-value (- value digit-with-0s)))
	(cond
	 ((zerop digit-with-0s) (to-roman--helper value next-top-bound acc))
	 ((>= top-bound 10000) (concat (make-string (/ value 1000) ?M) acc))
	 ((zerop (/ digit-with-0s mid-bound)) ;; lower half
	  (let ((lower-half-mod (mod digit-with-0s mid-bound)))
	    (cond
	     ((= (- mid-bound lower-bound) lower-half-mod)  ;; (low mid)
	      (to-roman--helper
	       next-value next-top-bound
	       (concat (string low-roman mid-roman) acc)))
	     (t                                                 ;; (low{1-3})
	      (to-roman--helper
	       next-value next-top-bound
	       (concat (make-string (/ lower-half-mod lower-bound) low-roman) acc))))))
	 (t                          ;; upper half
	  (cond
	   ((= mid-bound digit-with-0s)                                ;; (mid)
	    (to-roman--helper
	     next-value next-top-bound
	     (concat (string mid-roman) acc)))
	   ((= (- top-bound lower-bound) digit-with-0s)                     ;; (low  high)
	    (to-roman--helper
	     next-value next-top-bound
	     (concat (string low-roman high-roman) acc)))
	   (t                                                 ;; (mid low{1-3})
	    (to-roman--helper
	     next-value next-top-bound
	     (concat
	      (string mid-roman)
	      (make-string
	       (/ (- digit-with-0s mid-bound) lower-bound)
	       low-roman)
	      acc))))))))))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
