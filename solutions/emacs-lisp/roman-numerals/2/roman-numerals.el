;;; roman-numerals.el --- roman-numerals Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defvar roman-alist
  '((10 . (?I ?V ?X))
    (100 . (?X ?L ?C))
    (1000 . (?C ?D ?M))))

(defun to-roman (value)
  (to-roman--helper value 10 ""))

(defun to-roman--helper (value cur acc)
  (if (zerop value)
      acc
    (let ((roman-digits (alist-get cur roman-alist))
	  (div-result (/ value cur))
	  (half-cur (/ cur 2))
	  (digit (mod value cur)))
      (let ((low-roman (car roman-digits))
	    (mid-roman (cadr roman-digits))
	    (high-roman (caddr roman-digits))
	    (lower-bound (/ cur 10)))
	(cond
	 ((zerop digit) (to-roman--helper value (* 10 cur) acc))
	 ((>= cur 10000) (concat (make-string (/ value 1000) ?M) acc))
	 ((zerop (/ digit half-cur)) ;; lower half
	  (let ((lower-half-mod (mod digit half-cur)))
	    (cond
	     ((= (- half-cur lower-bound) (mod digit half-cur))  ;; (low mid)
	      (to-roman--helper
	       (- value digit)
	       (* 10 cur)
	       (concat (string low-roman mid-roman) acc)))
	     (t                                                 ;; (low{1-3})
	      (to-roman--helper
	       (- value digit)
	       (* 10 cur)
	       (concat (make-string (/ lower-half-mod lower-bound) low-roman) acc))))))
	 (t                          ;; upper half
	  (cond
	   ((= half-cur digit)                                ;; (mid)
	    (to-roman--helper
	     (- value digit)
	     (* 10 cur)
	     (concat (string mid-roman) acc)))
	   ((= (- cur lower-bound) digit)                     ;; (low  high)
	    (to-roman--helper
	     (- value digit)
	     (* 10 cur)
	     (concat (string low-roman high-roman) acc)))
	   (t                                                 ;; (mid low{1-3})
	    (to-roman--helper
	     (- value digit)
	     (* 10 cur)
	     (concat
	      (string mid-roman)
	      (make-string (/ (- digit half-cur) lower-bound) low-roman)
	      acc))))))))))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
