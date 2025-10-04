;;; allergies.el --- Allergies Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defconst allergen-alist
	    '((1 . "eggs")
	      (2 . "peanuts")
	      (4 . "shellfish")
	      (8 . "strawberries")
	      (16 . "tomatoes")
	      (32 . "chocolate")
	      (64 . "pollen")
	      (128 . "cats")))

(defun allergen-list (score)
  (seq-filter #'identity
	      (mapcar #'(lambda(alst-entry)
			  (pcase alst-entry
			    (`(,allergen-number . ,allergen)
			     (if (allergic-to-p score allergen)
				 allergen
			       nil))))
		      allergen-alist)))

(defun allergic-to-p (score allergen)
  (let ((allergen-number (car (rassoc allergen allergen-alist))))
    (if allergen-number 
	(not (= 0 (logand score allergen-number)))
      nil)))


(provide 'allergies)
;;; allergies.el ends here
