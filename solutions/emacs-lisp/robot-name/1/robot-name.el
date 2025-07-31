;;; robot-name.el --- Robot Name (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:
;;;
;;; Build a robot with a name like AA000, that can be reset to a new name.
;;; Instructions are in README.md
;;;

;;; Code:

(setq robot-series-list '())



(defun build-robot ()
  "Build a new robot with a random name."
  `(,(robot--make-name)))

(defun robot-name (robot)
  "Get the ROBOT's name."
  (car robot))

(defun reset-robot (robot)
  "Reset the name of ROBOT.  Factory reset!"
  (setcar robot (robot--make-name)))

(defun robot--random-upper ()
  (+ ?A (random (- ?Z ?A))))

(defun robot--random-digit ()
  (+ ?0 (random 9)))

(defun robot--make-name()
  (let ((name (string
               (robot--random-upper)
               (robot--random-upper)
               (robot--random-digit)
               (robot--random-digit)
               (robot--random-digit))))
    (if (seq-contains-p robot-series-list name)
        (robot--make-name)
      (progn
        (setq robot-series-list (cons name robot-series-list))
        name))))
             


(provide 'robot-name)
;;; robot-name.el ends here
