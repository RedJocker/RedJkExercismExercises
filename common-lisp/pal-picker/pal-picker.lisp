(defpackage :pal-picker
  (:use :cl)
  (:export :pal-picker :habitat-fitter :feeding-time-p
           :pet :play-fetch))

(in-package :pal-picker)

(defun pal-picker (personality)
  (case personality
    (:lazy "Cat")
    (:energetic "Dog")
    (:quiet "Fish")
    (:hungry "Rabbit")
    (:talkative "Bird")
    (:fireproof "I don't know... A dragon?")
    (otherwise "???")))

(defun habitat-fitter (weight)
  (cond ((<= weight 0) :just-your-imagination)
         ((<= weight 9) :small)
         ((<= weight 19) :medium)
         ((<= weight 39) :large)
         (t :massive)))

(defun feeding-time-p (fullness)
  (if (> fullness 20)
      "All is well."
      "It's feeding time!"))

(defun pet (pet)
  (when (string= "Fish" pet)
      "Maybe not with this pet..."))

(defun play-fetch (pet)
  (unless (string= "Dog" pet)
    "Maybe not with this pet..."))
