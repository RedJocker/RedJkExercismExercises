;;; robot-name.el --- Robot Name (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:
;;;
;;; Build a robot with a name like AA000, that can be reset to a new name.
;;; Instructions are in README.md
;;;

;;; Code:

(require 'seq)
(require 'cl-lib)

(defvar robot-series (make-hash-table :test #'equal))

(cl-defstruct bot name)

(defun build-robot ()
  "Build a new robot with a random name."
  (make-bot :name (robot--make-name)))

(defun robot-name (robot)
  "Get the ROBOT's name."
  (bot-name robot))

(defun reset-robot (robot)
  "Reset the name of ROBOT.  Factory reset!"
  (setf (bot-name robot) (robot--make-name)))

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
    (if (gethash name robot-series)
        (robot--make-name)
      (puthash name name robot-series))))

(provide 'robot-name)
;;; robot-name.el ends here
