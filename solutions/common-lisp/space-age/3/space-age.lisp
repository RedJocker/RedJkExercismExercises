(in-package #:cl-user)
(defpackage #:space-age
  (:use #:common-lisp)
  (:export #:on-earth
           #:on-mercury
           #:on-venus
           #:on-mars
           #:on-jupiter
           #:on-saturn
           #:on-uranus
           #:on-neptune))

(in-package #:space-age)

(setq planet-to-planetary-constant
      '((:mercury . 0.2408467)
        (:venus . 0.61519726)
        (:mars . 1.8808158)
        (:jupiter .  11.862615)
        (:saturn . 29.447498)
        (:uranus  .  84.016846)
        (:neptune . 164.79132)))


(defun on-earth(seconds)
  (/ seconds 31557600))

(defun to-earth (key seconds)
  (/ (on-earth seconds) (cdr (assoc key planet-to-planetary-constant))))


(defun on-mercury(seconds)
  (to-earth :mercury seconds))

(defun on-venus(seconds)
  (to-earth :venus seconds))

(defun on-mars(seconds)
  (to-earth :mars seconds))

(defun on-jupiter(seconds)
  (to-earth :jupiter seconds))

(defun on-saturn(seconds)
  (to-earth :saturn seconds))


(defun on-uranus(seconds)
  (to-earth :uranus seconds))

(defun on-neptune(seconds)
  (to-earth :neptune seconds))
