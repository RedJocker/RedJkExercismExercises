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

(defun to-earth (constant seconds)
  (/ (on-earth seconds) constant)) 


(defun on-mercury(seconds)
  (to-earth (cdr (assoc :mercury planet-to-planetary-constant)) seconds))

(defun on-venus(seconds)
  (to-earth (cdr (assoc :venus planet-to-planetary-constant)) seconds))

(defun on-mars(seconds)
  (to-earth (cdr (assoc :mars planet-to-planetary-constant)) seconds))

(defun on-jupiter(seconds)
  (to-earth (cdr (assoc :jupiter planet-to-planetary-constant)) seconds))

(defun on-saturn(seconds)
  (to-earth (cdr (assoc :saturn planet-to-planetary-constant)) seconds))


(defun on-uranus(seconds)
  (to-earth (cdr (assoc :uranus planet-to-planetary-constant)) seconds))

(defun on-neptune(seconds)
  (to-earth (cdr (assoc :neptune planet-to-planetary-constant)) seconds))
