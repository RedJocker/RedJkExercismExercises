;;; binary-search.el --- Binary Search (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun find-binary (array value)
  (cl-labels
      ((find-value (start end)
	 (when-let* ((guard (<= start end))
		     (half-i (+ start (/ (- end start) 2)))
		     (middle-elem (aref array half-i)))
	   (cond
	    ((= value middle-elem) half-i)
	    ((> value middle-elem) (find-value (1+ half-i) end))
	    (t (find-value start (- half-i 1)))))))
    (find-value 0 (- (length array) 1))))



;;(mapcar (lambda(el) (find-binary [1 3 5 6 7] el)) (number-sequence 0 8))

(provide 'binary-search)
;;; binary-search.el ends here
