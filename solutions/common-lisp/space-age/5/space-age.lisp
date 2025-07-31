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


(defun curryr(func arg) (lambda(other)(funcall func other arg)))

(defun on-earth(seconds)
  (/ seconds 31557600))

(defun to-earth (seconds constant)
  (/ (on-earth seconds) constant))


(defun planet-factory(name constant)
  (setf (fdefinition name) (curryr #'to-earth constant)))

(map nil #'planet-factory
     '(on-mercury on-venus on-mars on-jupiter on-saturn on-uranus on-neptune)
     '(0.2408467 0.61519726 1.8808158 11.862615 29.447498 84.016846 164.79132))



