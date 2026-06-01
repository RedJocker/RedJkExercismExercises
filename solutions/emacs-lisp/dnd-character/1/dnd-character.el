;;; dnd-character.el --- D&amp;D Character (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun modifier (score)
  (floor (/ (- score 10) 2.0)))


(defun ability ()
  (apply #'+
         (seq-take
          (seq-sort #'> (mapcar
                         (lambda (x) (1+ (random 6)))
                         (make-list 4 0)))
          3)))

(defun generate-dnd-character ()
  (let* ((abilities (mapcar #'funcall (make-list 6 #'ability)))
         (constitution (nth 2 abilities))
         (constitution-modifier (floor (/ (- constitution 10) 2.0)))
         (hitpoints (+ 10 constitution-modifier)))
    (apply
     #'record
     'dnd-character
     (append abilities (list hitpoints)))))


(provide 'dnd-character)
;;; dnd-character.el ends here

