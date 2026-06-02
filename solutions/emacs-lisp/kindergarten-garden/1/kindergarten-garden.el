;;; kindergarten-garden.el --- Kindergarten Garden (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun plants (diagram student)
  (when (string-blank-p student)
    (error "Invalid student %s" student))

  (let ((student-index (- (aref student 0) ?A))
        (plants-diagram (string-split diagram "\n")))
    (when (or (< student-index 0) (> student-index 25))
      (error "Invalid student initial %s" student))
    (cl-labels ((get-student-plants (l)
                  (seq-take (seq-drop l (* 2 student-index)) 2))
                (plant-from-initial (p)
                  (pcase p
                    (?G "grass")
                    (?C "clover")
                    (?R "radishes")
                    (?V "violets")
                    (_ (error "Invalid plant encoding %c" p))))
                (student-plants ()
                  (apply #'concat
                         (seq-map #'get-student-plants plants-diagram))))
      (seq-map #'plant-from-initial (student-plants)))))


(provide 'plants)
;;; kindergarten-garden.el ends here
